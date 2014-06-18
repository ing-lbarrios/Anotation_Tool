function  [action_stamp] = stamp_action (popup_value)
actions_list = {'walk','trot','jump','sit down',...
    'stand up','read a magazine/book','raise hand'...
    'erase board','write on board','say hi','call a friend with hands'...
    'use cellphone','talking with cellphone','crouch','drink','being sitted'...
    'idle','oral presentation','pick from the floor','pick object'...
    'put an object', 'head scratching', 'clap','pick cellphone from pocket'...
    'save cellphone', 'throw an object'};
switch (popup_value)
    case 2
        action_stamp = actions_list{1};
    case 3
        action_stamp = actions_list{2};
    case 4
        action_stamp = actions_list{3};
    case 5
        action_stamp = actions_list{4};
    case 6
        action_stamp = actions_list{5};
    case 7
        action_stamp = actions_list{6};
    case 8
        action_stamp = actions_list{7};
    case 9
        action_stamp = actions_list{8};
    case 10
        action_stamp = actions_list{9};
    case 11
        action_stamp = actions_list{10};
    case 12
        action_stamp = actions_list{11};
    case 13
        action_stamp = actions_list{12};
    case 14
        action_stamp = actions_list{13};
    case 15
        action_stamp = actions_list{14};
    case 16
        action_stamp = actions_list{15};
    case 17
        action_stamp = actions_list{16};
    case 18
        action_stamp = actions_list{17};
    case 19
        action_stamp = actions_list{18};
    case 20
        action_stamp = actions_list{19};
    case 21
        action_stamp = actions_list{20};
    case 22
        action_stamp = actions_list{21};
    case 23
        action_stamp = actions_list{22};
    case 24
        action_stamp = actions_list{23};
    case 25
        action_stamp = actions_list{24};
    case 26
        action_stamp = actions_list{25};
    case 27
        action_stamp = actions_list{26};
    otherwise
        action_stamp = 0;
end

end