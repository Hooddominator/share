<?php
// generates a json-string with current systemmetrics, just for generating some test-data on rpi
function mem(){
        $free = shell_exec('free');
        $free = (string)trim($free);
        $free_arr = explode("\n", $free);
        $mem = explode(" ", $free_arr[1]);
        $mem = array_filter($mem);
        $mem = array_merge($mem);
        $memory_usage = $mem[2]/$mem[1]*100;
        return $memory_usage;
}
function cpu(){
        $load = sys_getloadavg();
        return $load[0];
}
function temp(){
        $temp = shell_exec('cat /sys/class/thermal/thermal_zone0/temp');
        return $temp/1000;
}
echo json_encode(['host' => gethostname(),'cpu'  => cpu(),'mem'  => mem(),'temp' => temp()]);
