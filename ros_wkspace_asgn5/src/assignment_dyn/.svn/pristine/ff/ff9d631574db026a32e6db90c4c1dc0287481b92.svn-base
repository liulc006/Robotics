# coding: UTF-8
import sys
l1llllll1_opy_ = sys.version_info [0] == 2
l1l1l_opy_ = 2048
l1ll1111_opy_ = 7
def l11l11ll_opy_ (l11_opy_):
    global l1llll1ll_opy_
    l1llll11_opy_ = ord (l11_opy_ [-1])
    l1_opy_ = l11_opy_ [:-1]
    l11l11l1_opy_ = l1llll11_opy_ % len (l1_opy_)
    l1l111ll_opy_ = l1_opy_ [:l11l11l1_opy_] + l1_opy_ [l11l11l1_opy_:]
    if l1llllll1_opy_:
        l111l_opy_ = unicode () .join ([unichr (ord (char) - l1l1l_opy_ - (l1llll1l1_opy_ + l1llll11_opy_) % l1ll1111_opy_) for l1llll1l1_opy_, char in enumerate (l1l111ll_opy_)])
    else:
        l111l_opy_ = str () .join ([chr (ord (char) - l1l1l_opy_ - (l1llll1l1_opy_ + l1llll11_opy_) % l1ll1111_opy_) for l1llll1l1_opy_, char in enumerate (l1l111ll_opy_)])
    return eval (l111l_opy_)
import sys
import numpy as np
from arm_dynamics_teacher import ArmDynamicsTeacher
from arm_dynamics_student import ArmDynamicsStudent
from robot import Robot
from arm_gui import ArmGUI
import argparse
import time
import math
def main(args):
    (lambda __1ll11lll_opy_, __1ll11l1l_opy_: [[[[None for __1ll11l1l_opy_[l11l11ll_opy_ (u"ࠨࡧࡵࡶࡴࡸࠧࢗ")], error.__name__ in [(lambda : (lambda __1ll1l1ll_opy_: [[[(lambda __1ll1ll11_opy_, __1ll11l11_opy_, __1ll11ll1_opy_: __1ll11lll_opy_(lambda __1ll1l1l1_opy_: lambda: (lambda __1ll1l11l_opy_: [[__1ll1l1l1_opy_() for __1ll1l1ll_opy_[l11l11ll_opy_ (u"ࠩࡰࡥࡽࡥࡥࡳࡴࡲࡶࠬ࢘")] in [(max(__1ll1l1ll_opy_[l11l11ll_opy_ (u"ࠪࡱࡦࡾ࡟ࡦࡴࡵࡳࡷ࢙࠭")], abs((__1ll1l1ll_opy_[l11l11ll_opy_ (u"ࠫࡶࡥࡴࠨ࢚")][__1ll1l1ll_opy_[l11l11ll_opy_ (u"ࠬ࡯࢛ࠧ")]] - __1ll1l1ll_opy_[l11l11ll_opy_ (u"࠭ࡱࡠࡵࠪ࢜")][__1ll1l1ll_opy_[l11l11ll_opy_ (u"ࠧࡪࠩ࢝")]]))))]][0] for __1ll1l1ll_opy_[l11l11ll_opy_ (u"ࠨ࡫ࠪ࢞")] in [(__1ll1l11l_opy_)]][0] if __1ll1l11l_opy_ is not __1ll11l11_opy_ else __1ll11ll1_opy_())(next(__1ll1ll11_opy_, __1ll11l11_opy_)))())(iter(range(0, args.num_links)), [], lambda: __1ll1l1ll_opy_[l11l11ll_opy_ (u"ࠩࡰࡥࡽࡥࡥࡳࡴࡲࡶࠬ࢟")]) for __1ll1l1ll_opy_[l11l11ll_opy_ (u"ࠪࡱࡦࡾ࡟ࡦࡴࡵࡳࡷ࠭ࢠ")] in [(0)]][0] for __1ll1l1ll_opy_[l11l11ll_opy_ (u"ࠫࡶࡥࡳࠨࢡ")] in [(l1lll1ll1_opy_.dynamics.get_q(l1lll1ll1_opy_.get_state()))]][0] for __1ll1l1ll_opy_[l11l11ll_opy_ (u"ࠬࡷ࡟ࡵࠩࢢ")] in [(l1lll111l_opy_.dynamics.get_q(l1lll111l_opy_.get_state()))]][0])({}), l11l11ll_opy_ (u"࠭ࡥࡳࡴࡲࡶࠬࢣ"))]][0] for __1ll11l1l_opy_[l11l11ll_opy_ (u"ࠧࡨࡧࡷࡣࡹࡵࡲࡲࡷࡨࠫࢤ")], get_torque.__name__ in [(lambda num_links, link_mass, link_length: (lambda __1ll1l1ll_opy_: [(0.65 * (((((__1ll1l1ll_opy_[l11l11ll_opy_ (u"ࠨࡰࡸࡱࡤࡲࡩ࡯࡭ࡶࠫࢥ")] - 1) * __1ll1l1ll_opy_[l11l11ll_opy_ (u"ࠩ࡯࡭ࡳࡱ࡟࡮ࡣࡶࡷࠬࢦ")]) * 9.8) * __1ll1l1ll_opy_[l11l11ll_opy_ (u"ࠪࡰ࡮ࡴ࡫ࡠ࡮ࡨࡲ࡬ࡺࡨࠨࢧ")]) + (((0.5 * __1ll1l1ll_opy_[l11l11ll_opy_ (u"ࠫࡱ࡯࡮࡬ࡡࡰࡥࡸࡹࠧࢨ")]) * 9.8) * __1ll1l1ll_opy_[l11l11ll_opy_ (u"ࠬࡲࡩ࡯࡭ࡢࡰࡪࡴࡧࡵࡪࠪࢩ")]))) for __1ll1l1ll_opy_[l11l11ll_opy_ (u"࠭࡮ࡶ࡯ࡢࡰ࡮ࡴ࡫ࡴࠩࢪ")], __1ll1l1ll_opy_[l11l11ll_opy_ (u"ࠧ࡭࡫ࡱ࡯ࡤࡳࡡࡴࡵࠪࢫ")], __1ll1l1ll_opy_[l11l11ll_opy_ (u"ࠨ࡮࡬ࡲࡰࡥ࡬ࡦࡰࡪࡸ࡭࠭ࢬ")] in [(num_links, link_mass, link_length)]][0])({}), l11l11ll_opy_ (u"ࠩࡪࡩࡹࡥࡴࡰࡴࡴࡹࡪ࠭ࢭ"))]][0] for __1ll11l1l_opy_[l11l11ll_opy_ (u"ࠪࡷࡪࡺ࡟ࡲ࠲ࠪࢮ")], set_q0.__name__ in [(lambda q: (lambda __1ll1l1ll_opy_: [[[None for l1lll1ll1_opy_.state[0] in [(__1ll1l1ll_opy_[l11l11ll_opy_ (u"ࠫࡶ࠭ࢯ")])]][0] for l1lll111l_opy_.state[0] in [(__1ll1l1ll_opy_[l11l11ll_opy_ (u"ࠬࡷࠧࢰ")])]][0] for __1ll1l1ll_opy_[l11l11ll_opy_ (u"࠭ࡱࠨࢱ")] in [(q)]][0])({}), l11l11ll_opy_ (u"ࠧࡴࡧࡷࡣࡶ࠶ࠧࢲ"))]][0] for __1ll11l1l_opy_[l11l11ll_opy_ (u"ࠨࡵࡨࡸࡤࡳࡵ࠱ࠩࢳ")], set_mu0.__name__ in [(lambda torque: (lambda __1ll1l1ll_opy_: [[[(l1lll111l_opy_.set_action(__1ll1l1ll_opy_[l11l11ll_opy_ (u"ࠩࡤࡧࡹ࡯࡯࡯ࠩࢴ")]), (l1lll1ll1_opy_.set_action(__1ll1l1ll_opy_[l11l11ll_opy_ (u"ࠪࡥࡨࡺࡩࡰࡰࠪࢵ")]), None)[1])[1] for __1ll1l1ll_opy_[l11l11ll_opy_ (u"ࠫࡦࡩࡴࡪࡱࡱࠫࢶ")][0] in [(__1ll1l1ll_opy_[l11l11ll_opy_ (u"ࠬࡺ࡯ࡳࡳࡸࡩࠬࢷ")])]][0] for __1ll1l1ll_opy_[l11l11ll_opy_ (u"࠭ࡡࡤࡶ࡬ࡳࡳ࠭ࢸ")] in [(np.zeros((l1lll11l1_opy_.get_action_dim(), 1)))]][0] for __1ll1l1ll_opy_[l11l11ll_opy_ (u"ࠧࡵࡱࡵࡵࡺ࡫ࠧࢹ")] in [(torque)]][0])({}), l11l11ll_opy_ (u"ࠨࡵࡨࡸࡤࡳࡵ࠱ࠩࢺ"))]][0])((lambda f: (lambda x: x(x))(lambda y: f(lambda: y(y)()))), globals())
    l1lll11l1_opy_ = ArmDynamicsTeacher(
        args.num_links,
        args.link_mass,
        args.link_length,
        args.friction,
        True,
        args.time_step
        )
    l1lll111l_opy_  = Robot(l1lll11l1_opy_)
    l1lll1l1l_opy_ = ArmDynamicsStudent(
    #l1lll1l1l_opy_ = ArmDynamicsTeacher(
        args.num_links,
        args.link_mass,
        args.link_length,
        args.friction,
        True,
        args.time_step
        )
    l1lll1ll1_opy_ = Robot(l1lll1l1l_opy_)
    if args.gui:
        gui = ArmGUI()
        gui.l1lll1l11_opy_(l1lll111l_opy_, l11l11ll_opy_ (u"ࠩࡷࡥࡧࡀࡢ࡭ࡷࡨࠫࢻ"))
        gui.l1lll1l11_opy_(l1lll1ll1_opy_, l11l11ll_opy_ (u"ࠪࡸࡦࡨ࠺ࡳࡧࡧࠫࢼ"))
        gui.start()
    torque = get_torque(args.num_links, args.link_mass, args.link_length)
    set_mu0(torque)
    set_q0(-math.pi/2.0)
    dt = max(l1lll11l1_opy_.dt, l1lll1l1l_opy_.dt)
    l1ll1lll1_opy_ = 0
    time.sleep(1)
    success = True
    while True:
        if l1lll111l_opy_.get_t() > 8.0 and torque > 0:
            torque = 0
            set_mu0(torque)
            e = error()
            #print(l11l11ll_opy_ (u"ࠦࡊࡸࡲࡰࡴࠣ࡭ࡸࡀࠠࠣࢽ") + str(e))
            if e > 0.05:
                success = False
                break
        if l1lll111l_opy_.get_t() > 20.0:
            e = error()
            #print(l11l11ll_opy_ (u"ࠧࡋࡲࡳࡱࡵࠤ࡮ࡹ࠺ࠡࠤࢾ") + str(e))
            if e > 0.05:
                success = False
            break
        t = time.time()
        l1lll111l_opy_.advance()
        l1lll1ll1_opy_.advance()
        l1ll1lll1_opy_ = max(l1ll1lll1_opy_, error())
        time.sleep(max(0, dt - (time.time()-t)))
    print(l11l11ll_opy_ (u"ࠨࡐࡢࡵࡶ࠾ࠥࠨࢿ") + str(success))
    if args.gui:
        gui.close()
        time.sleep(0.25)
    if success: return 0
    return 1
if __name__ == l11l11ll_opy_ (u"ࠧࡠࡡࡰࡥ࡮ࡴ࡟ࡠࠩࣀ"):
    parser = argparse.ArgumentParser()
    parser.add_argument(l11l11ll_opy_ (u"ࠨ࠯࠰ࡲࡺࡳ࡟࡭࡫ࡱ࡯ࡸ࠭ࣁ"), type=int, default=3)
    parser.add_argument(l11l11ll_opy_ (u"ࠩ࠰࠱ࡱ࡯࡮࡬ࡡࡰࡥࡸࡹࠧࣂ"), type=float, default=0.1)
    parser.add_argument(l11l11ll_opy_ (u"ࠪ࠱࠲ࡲࡩ࡯࡭ࡢࡰࡪࡴࡧࡵࡪࠪࣃ"), type=float, default=1)
    parser.add_argument(l11l11ll_opy_ (u"ࠫ࠲࠳ࡦࡳ࡫ࡦࡸ࡮ࡵ࡮ࠨࣄ"), type=float, default=0.1)
    parser.add_argument(l11l11ll_opy_ (u"ࠬ࠳࠭ࡵ࡫ࡰࡩࡤࡹࡴࡦࡲࠪࣅ"), type=float, default=0.01)
    parser.add_argument(l11l11ll_opy_ (u"࠭࠭࠮ࡩࡸ࡭ࠬࣆ"), action=l11l11ll_opy_ (u"ࠧࡴࡶࡲࡶࡪࡥࡣࡰࡰࡶࡸࠬࣇ"), const = True, default = False)
    sys.exit(main(parser.parse_args()))