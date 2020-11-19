#!/usr/bin/env python3
# coding: UTF-8
import sys
l11ll1l1_opy_ = sys.version_info [0] == 2
l1_opy_ = 2048
l111l1l_opy_ = 7
def l1llllll1_opy_ (l11l1111_opy_):
    global l11l1l11_opy_
    l1lll111_opy_ = ord (l11l1111_opy_ [-1])
    l1111ll1_opy_ = l11l1111_opy_ [:-1]
    l1lll1ll1_opy_ = l1lll111_opy_ % len (l1111ll1_opy_)
    l111_opy_ = l1111ll1_opy_ [:l1lll1ll1_opy_] + l1111ll1_opy_ [l1lll1ll1_opy_:]
    if l11ll1l1_opy_:
        l1llll1l_opy_ = unicode () .join ([l1l1ll_opy_ (ord (char) - l1_opy_ - (l1ll1lll_opy_ + l1lll111_opy_) % l111l1l_opy_) for l1ll1lll_opy_, char in enumerate (l111_opy_)])
    else:
        l1llll1l_opy_ = str () .join ([chr (ord (char) - l1_opy_ - (l1ll1lll_opy_ + l1lll111_opy_) % l111l1l_opy_) for l1ll1lll_opy_, char in enumerate (l111_opy_)])
    return eval (l1llll1l_opy_)
import sys
sys.path.append(l1llllll1_opy_ (u"ࠨ࠮ࠣࢀ"))
import numpy
import rospy
import tf
import geometry_msgs.msg
def timeout(event):
    print(l1llllll1_opy_ (u"ࠢࡏࡱࠣࡸࡷࡧ࡮ࡴࡨࡲࡶࡲࡹࠠࡳࡧࡦࡩ࡮ࡼࡥࡥ࠰ࠣࡋࡷࡧࡤࡦࡴࠣࡸ࡮ࡳࡥࡥࠢࡲࡹࡹ࠴ࠢࢁ"))
if __name__ == l1llllll1_opy_ (u"ࠨࡡࡢࡱࡦ࡯࡮ࡠࡡࠪࢂ"):
    rospy.init_node(l1llllll1_opy_ (u"ࠩࡳࡶࡴࡰࡥࡤࡶ࠴ࡣ࡬ࡸࡡࡥࡧࡵࠫࢃ"))
    listener = tf.TransformListener()
    rospy.sleep(0.5)
    rospy.Timer(rospy.Duration(10), timeout, True)

    (lambda __g: [[[[[[[[[[[[[[None for __g['l1ll11ll1_opy_'] in [(0)]][0] for __g['l1l1ll1l1_opy_'] in [(numpy.dot(l1ll11l1l_opy_, tf.transformations.quaternion_matrix(l1l1lllll_opy_)))]][0] for __g['l1l1lllll_opy_'] in [(tf.transformations.quaternion_about_axis(l1l1ll1ll_opy_, axis))]][0] for __g['l1l1ll1ll_opy_'] in [((-numpy.arccos(numpy.dot(l1ll11111_opy_, numpy.array([1, 0, 0])))))]][0] for __g['axis'] in [(numpy.cross(l1ll11111_opy_, numpy.array([1, 0, 0])))]][0] for __g['l1ll11111_opy_'] in [((l1ll11lll_opy_ / numpy.linalg.norm(l1ll11lll_opy_)))]][0] for __g['l1ll11lll_opy_'] in [(tf.transformations.translation_from_matrix(l1l1lll11_opy_))]][0] for __g['l1l1lll11_opy_'] in [(numpy.dot(tf.transformations.inverse_matrix(l1ll11l1l_opy_), l1l1lll1l_opy_))]][0] for __g['l1ll11l1l_opy_'] in [(numpy.dot(l1ll111ll_opy_, l1ll1l111_opy_))]][0] for __g['l1ll1l111_opy_'] in [(tf.transformations.translation_matrix((0.3, 0.0, 0.3)))]][0] for __g['l1ll111ll_opy_'] in [(numpy.dot(tf.transformations.quaternion_matrix(l1ll111l1_opy_), tf.transformations.translation_matrix((0.0, 0.0, (-2.0)))))]][0] for __g['l1ll111l1_opy_'] in [(tf.transformations.quaternion_about_axis(1.5, (0, 1, 0)))]][0] for __g['l1l1lll1l_opy_'] in [(numpy.dot(tf.transformations.quaternion_matrix(l1ll11l11_opy_), tf.transformations.translation_matrix((1.5, 0.8, 0.0))))]][0] for __g['l1ll11l11_opy_'] in [(tf.transformations.quaternion_from_euler(0.64, 0.64, 0.0))]][0])(globals())

    print(l1llllll1_opy_ (u"ࠥࡊ࡮ࡸࡳࡵࠢࡷࡶࡦࡴࡳࡧࡱࡵࡱࠧࢄ"))
    try:
        l1ll1l11l_opy_ = False
        (l1ll1111l_opy_,l1l1ll1ll_opy_) = listener.lookupTransform(l1llllll1_opy_ (u"ࠫࡧࡧࡳࡦࡡࡩࡶࡦࡳࡥࠨࢅ"), l1llllll1_opy_ (u"ࠬࡵࡢ࡫ࡧࡦࡸࡤ࡬ࡲࡢ࡯ࡨࠫࢆ"), rospy.Time(0))
        if (abs(l1ll1111l_opy_ - tf.transformations.translation_from_matrix(l1l1lll1l_opy_)) < 10e-4).all():
            print( l1llllll1_opy_ (u"ࠨࡏࡣ࡬ࡨࡧࡹࠦࡴࡳࡣࡱࡷࡱࡧࡴࡪࡱࡱ࠾ࠥࡖࡁࡔࡕࡈࡈࠧࢇ"))
            l1ll1l11l_opy_ = True
        else:
            print(l1llllll1_opy_ (u"ࠢࡐࡤ࡭ࡩࡨࡺࠠࡵࡴࡤࡲࡸࡲࡡࡵ࡫ࡲࡲ࠿ࠦࡆࡂࡋࡏࡉࡉࠨ࢈"))
        if (abs(l1l1ll1ll_opy_ - tf.transformations.quaternion_from_matrix(l1l1lll1l_opy_)) < 10e-4).all():
            print(l1llllll1_opy_ (u"ࠣࡑࡥ࡮ࡪࡩࡴࠡࡴࡲࡸࡦࡺࡩࡰࡰ࠽ࠤࡕࡇࡓࡔࡇࡇࠦࢉ"))
        else:
            print(l1llllll1_opy_ (u"ࠤࡒࡦ࡯࡫ࡣࡵࠢࡵࡳࡹࡧࡴࡪࡱࡱ࠾ࠥࡌࡁࡊࡎࡈࡈࠧࢊ"))
            l1ll1l11l_opy_ = False
        if l1ll1l11l_opy_:
            print(l1llllll1_opy_ (u"ࠥࡓࡧࡰࡥࡤࡶࠣࡸࡷࡧ࡮ࡴࡨࡲࡶࡲࡀࠠ࠴ࠤࢋ"))
            l1ll11ll1_opy_ = l1ll11ll1_opy_ + 3
        else:
            print(l1llllll1_opy_ (u"ࠦࡔࡨࡪࡦࡥࡷࠤࡹࡸࡡ࡯ࡵࡩࡳࡷࡳ࠺ࠡ࠲ࠥࢌ"))
    except tf.Exception:
        print(l1llllll1_opy_ (u"ࠧࡈࡡࡴࡧ࠰ࡂࡔࡨࡪࡦࡥࡷ࠾ࠥࡊࡩࡥࠢࡱࡳࡹࠦࡲࡦࡥࡨ࡭ࡻ࡫ࠠࡷࡣ࡯࡭ࡩࠦࡴࡳࡣࡱࡷ࡫ࡵࡲ࡮ࠤࢍ"))
        print(l1llllll1_opy_ (u"ࠨࡏࡣ࡬ࡨࡧࡹࠦࡴࡳࡣࡱࡷ࡫ࡵࡲ࡮࠼ࠣ࠴ࠧࢎ"))
    print(l1llllll1_opy_ (u"ࠢ࡝ࡰࠥ࢏"))
    print(l1llllll1_opy_ (u"ࠣ࠴ࡱࡨࠥࡺࡲࡢࡰࡶࡪࡴࡸ࡭࠻ࠤ࢐"))
    try:
        l1ll1l11l_opy_ = False
        (l1ll1111l_opy_,l1l1ll1ll_opy_) = listener.lookupTransform(l1llllll1_opy_ (u"ࠩࡥࡥࡸ࡫࡟ࡧࡴࡤࡱࡪ࠭࢑"), l1llllll1_opy_ (u"ࠪࡶࡴࡨ࡯ࡵࡡࡩࡶࡦࡳࡥࠨ࢒"), rospy.Time(0))
        if (abs(l1ll1111l_opy_ - tf.transformations.translation_from_matrix(l1ll111ll_opy_)) < 10e-4).all():
            print(l1llllll1_opy_ (u"ࠦࡗࡵࡢࡰࡶࠣࡸࡷࡧ࡮ࡴ࡮ࡤࡸ࡮ࡵ࡮࠻ࠢࡓࡅࡘ࡙ࡅࡅࠤ࢓"))
            l1ll1l11l_opy_ = True
        else:
            print(l1llllll1_opy_ (u"ࠧࡘ࡯ࡣࡱࡷࠤࡹࡸࡡ࡯ࡵ࡯ࡥࡹ࡯࡯࡯࠼ࠣࡊࡆࡏࡌࡆࡆࠥ࢔"))
        if (abs(l1l1ll1ll_opy_ - tf.transformations.quaternion_from_matrix(l1ll111ll_opy_)) < 10e-4).all():
            print(l1llllll1_opy_ (u"ࠨࡒࡰࡤࡲࡸࠥࡸ࡯ࡵࡣࡷ࡭ࡴࡴ࠺ࠡࡒࡄࡗࡘࡋࡄࠣ࢕"))
        else:
            print(l1llllll1_opy_ (u"ࠢࡓࡱࡥࡳࡹࠦࡲࡰࡶࡤࡸ࡮ࡵ࡮࠻ࠢࡉࡅࡎࡒࡅࡅࠤ࢖"))
            l1ll1l11l_opy_ = False
        if l1ll1l11l_opy_:
            print(l1llllll1_opy_ (u"ࠣࡔࡲࡦࡴࡺࠠࡵࡴࡤࡲࡸ࡬࡯ࡳ࡯࠽ࠤ࠸ࠨࢗ"))
            l1ll11ll1_opy_ = l1ll11ll1_opy_ + 3
        else:
            print(l1llllll1_opy_ (u"ࠤࡕࡳࡧࡵࡴࠡࡶࡵࡥࡳࡹࡦࡰࡴࡰ࠾ࠥ࠶ࠢ࢘"))
    except tf.Exception:
        print(l1llllll1_opy_ (u"ࠥࡆࡦࡹࡥ࠮ࡀࡕࡳࡧࡵࡴ࠻ࠢࡇ࡭ࡩࠦ࡮ࡰࡶࠣࡶࡪࡩࡥࡪࡸࡨࠤࡻࡧ࡬ࡪࡦࠣࡸࡷࡧ࡮ࡴࡨࡲࡶࡲࠨ࢙"))
        print(l1llllll1_opy_ (u"ࠦࡗࡵࡢࡰࡶࠣࡸࡷࡧ࡮ࡴࡨࡲࡶࡲࡀࠠ࠱ࠤ࢚"))
    print(l1llllll1_opy_ (u"ࠧࡢ࡮࢛ࠣ"))
    print(l1llllll1_opy_ (u"ࠨ࠳ࡳࡦࠣࡘࡷࡧ࡮ࡴࡨࡲࡶࡲࡀࠢ࢜"))
    l1ll1l11l_opy_ = False
    try:
        (l1ll1111l_opy_,l1l1ll1ll_opy_) = listener.lookupTransform(l1llllll1_opy_ (u"ࠧࡳࡱࡥࡳࡹࡥࡦࡳࡣࡰࡩࠬ࢝"), l1llllll1_opy_ (u"ࠨࡥࡤࡱࡪࡸࡡࡠࡨࡵࡥࡲ࡫ࠧ࢞"), rospy.Time(0))
        if (abs(l1ll1111l_opy_ - tf.transformations.translation_from_matrix(l1ll1l111_opy_)) < 10e-4).all():
            print(l1llllll1_opy_ (u"ࠤࡆࡥࡲ࡫ࡲࡢࠢࡷࡶࡦࡴࡳ࡭ࡣࡷ࡭ࡴࡴ࠺ࠡࡒࡄࡗࡘࡋࡄࠣ࢟"))
            l1ll1l11l_opy_ = True
        else:
            print(l1llllll1_opy_ (u"ࠥࡇࡦࡳࡥࡳࡣࠣࡸࡷࡧ࡮ࡴ࡮ࡤࡸ࡮ࡵ࡮࠻ࠢࡉࡅࡎࡒࡅࡅࠤࢠ"))
    except tf.Exception:
        print(l1llllll1_opy_ (u"ࠦࡗࡵࡢࡰࡶ࠰ࡂࡈࡧ࡭ࡦࡴࡤ࠾ࠥࡊࡩࡥࠢࡱࡳࡹࠦࡲࡦࡥࡨ࡭ࡻ࡫ࠠࡷࡣ࡯࡭ࡩࠦࡴࡳࡣࡱࡷ࡫ࡵࡲ࡮ࠤࢡ"))
    try:
        (l1ll1111l_opy_,l1l1ll1ll_opy_) = listener.lookupTransform(l1llllll1_opy_ (u"ࠬࡨࡡࡴࡧࡢࡪࡷࡧ࡭ࡦࠩࢢ"), l1llllll1_opy_ (u"࠭ࡣࡢ࡯ࡨࡶࡦࡥࡦࡳࡣࡰࡩࠬࢣ"), rospy.Time(0))
        l1l1ll11l_opy_ = tf.transformations.quaternion_matrix(l1l1ll1ll_opy_)[0:3,0]
        l1l1llll1_opy_ = l1l1ll1l1_opy_[0:3,0]
        if (abs(l1l1ll11l_opy_ - l1l1llll1_opy_) < 10e-4).all():
            print(l1llllll1_opy_ (u"ࠢࡄࡣࡰࡩࡷࡧࠠࡢ࡫ࡰ࠾ࠥࡖࡁࡔࡕࡈࡈࠧࢤ"))
        else:
            print(l1llllll1_opy_ (u"ࠣࡅࡤࡱࡪࡸࡡࠡࡣ࡬ࡱ࠿ࠦࡆࡂࡋࡏࡉࡉࠨࢥ"))
            l1ll1l11l_opy_ = False
    except tf.Exception:
        print(l1llllll1_opy_ (u"ࠤࡅࡥࡸ࡫࠭࠿ࡅࡤࡱࡪࡸࡡ࠻ࠢࡇ࡭ࡩࠦ࡮ࡰࡶࠣࡶࡪࡩࡥࡪࡸࡨࠤࡻࡧ࡬ࡪࡦࠣࡸࡷࡧ࡮ࡴࡨࡲࡶࡲࠨࢦ"))
        l1ll1l11l_opy_ = False
    if l1ll1l11l_opy_:
        print(l1llllll1_opy_ (u"ࠥࡇࡦࡳࡥࡳࡣࠣࡸࡷࡧ࡮ࡴࡨࡲࡶࡲࡀࠠ࠵ࠤࢧ"))
        l1ll11ll1_opy_ = l1ll11ll1_opy_ + 4
    else:
        print(l1llllll1_opy_ (u"ࠦࡈࡧ࡭ࡦࡴࡤࠤࡹࡸࡡ࡯ࡵࡩࡳࡷࡳ࠺ࠡ࠲ࠥࢨ"))
    print(l1llllll1_opy_ (u"ࠧࡢ࡮ࠣࢩ"))
    print(l1llllll1_opy_ (u"ࠨࡇࡳࡣࡧࡩ࠿ࠦࠥࡥࠤࢪ")%l1ll11ll1_opy_)