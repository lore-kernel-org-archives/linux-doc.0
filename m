Return-Path: <SRS0=jIxK=EE=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20175C2D0A3
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 15:14:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA3CC2076E
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 15:14:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725782AbgJ2POl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Oct 2020 11:14:41 -0400
Received: from m176151.mail.qiye.163.com ([59.111.176.151]:13043 "EHLO
        m176151.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726824AbgJ2POl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Oct 2020 11:14:41 -0400
Received: from vivo.com (wm-11.qy.internal [127.0.0.1])
        by m176151.mail.qiye.163.com (Hmail) with ESMTP id AAF2B48195A;
        Thu, 29 Oct 2020 23:14:35 +0800 (CST)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <APsAJAC5DWLWIDvVxtu8lKqh.3.1603984475694.Hmail.bailu.lin@vivo.com>
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Harry Wei <harryxiyou@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@vivo.com
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSF0gRG9jdW1lbnRhdGlvbjogQ2hpbmVzZSB0cmFuc2xhdGlvbiBvZiBEb2N1bWVudGF0aW9uL2FybTY0L3BlcmYucnN0?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 58.250.176.229
In-Reply-To: <85fe8e8a-96f2-cd6a-a107-ebbfc50a46bf@linux.alibaba.com>
MIME-Version: 1.0
Received: from bailu.lin@vivo.com( [58.250.176.229) ] by ajax-webmail ( [127.0.0.1] ) ; Thu, 29 Oct 2020 23:14:35 +0800 (GMT+08:00)
From:   Bailu Lin <bailu.lin@vivo.com>
Date:   Thu, 29 Oct 2020 23:14:35 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZGhhJS0NJSBlOH0tPVkpNS0hCQ09PTE5MSkpVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kJHlYWEh9ZQU5CT0pCTk9NSEhON1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
        WUc6Kwg6MTo4Tj8sNywyPw0tAw8OQxcwChNVSFVKTUtIQkNPT0xNSkhOVTMWGhIXVRkaEhcOVRcS
        FTsNEg0UVRgUFkVZV1kSC1lBWU5DVUlOS1VKTE1VSUlCWVdZCAFZQU5KSUw3Bg++
X-HM-Tid: 0a7574ecc63893b5kuwsaaf2b48195a
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Cj4+ICsKPj4gK+WvueS6jiBub24tVkhFIOS4u+acuuerr+ivpeWxnuaAp+WwhuaOkumZpCBFTDLv
vIzlm6DkuLromZrmi5/mnLrnm5Hmjqflmajov5DooYzlnKggRUwyCj4+ICvnmoTku7vkvZXku6Pn
oIHkuLvopoHnlKjkuo7lrqLmiLfnq6/lkozkuLvmnLrnq6/nmoTliIfmjaLjgIIKPj4gKwo+PiAr
5a+55LqO5a6i5oi356uv6K+l5bGe5oCn5peg5pWI44CC6K+35rOo5oSP5a6i5oi356uv5LuO5p2l
5LiN5Lya6L+Q6KGM5ZyoIEVMMuOAggo+PiArCj4+ICsKPj4gK2V4Y2x1ZGVfaG9zdCAvIGV4Y2x1
ZGVfZ3Vlc3QKPj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gKwo+PiAr6L+Z5Lqb
5bGe5oCn5YiG5Yir5o6S6Zmk5LqGIEtWTSDkuLvmnLrnq6/lkozlrqLmiLfnq6/jgIIKPj4gKwo+
PiArS1ZNIOS4u+acuuerr+WPr+iDvei/kOihjOWcqCBFTDDvvIjnlKjmiLfnqbrpl7TvvInvvIxF
TDHvvIhub24tVkhFIOWGheaguO+8ieWSjAo+PiArRUwy77yIVkhFIOWGheaguCDmiJYgbm9uLVZI
RSDomZrmi5/mnLrnm5HmjqflmajvvInjgIIKPj4gKwo+PiArS1ZNIOWuouaIt+err+WPr+iDvei/
kOihjOWcqCBFTDDvvIjnlKjmiLfnqbrpl7TvvInlkowgRUwx77yI5YaF5qC477yJ44CCCj4+ICsK
Pj4gK+eUseS6juS4u+acuuerr+WSjOWuouaIt+err+S5i+mXtOmHjeWPoOeahOW8guW4uOe6p+WI
q++8jOaIkeS7rOS4jeiDveS7heS7heS+nemdoCBQTVUg55qE56Gs5Lu25byCCj4+ICvluLjov4fm
u6TmnLrliLYt5Zug5q2k5oiR5Lus5b+F6aG75ZCv55SoL+emgeeUqOWvueS6juWuouaIt+err+i/
m+WFpeWSjOmAgOWHuueahOiuoeaVsOOAguiAjOi/meWcqAo+PiArVkhFIOWSjCBub24tVkhFIOez
u+e7n+S4iuihqOeOsOS4jeWQjOOAggo+PiArCj4+ICvlr7nkuo4gbm9uLVZIRSDns7vnu5/nmoQg
ZXhjbHVkZV9ob3N0IOWxnuaAp+aOkumZpCBFTDIgLSAg5Zyo6L+b5YWl5ZKM6YCA5Ye65a6i5oi3
Cj4+ICvnq6/ml7bvvIzmiJHku6zkvJrmoLnmja4gZXhjbHVkZV9ob3N0IOWSjCBleGNsdWRlX2d1
ZXN0IOWxnuaAp+WcqOmAguW9k+eahOaDheWGteS4iwo+PiAr56aB55SoL+WQr+eUqOivpeS6i+S7
tuOAggo+PiArCj4+ICvlr7nkuo4gVkhFIOezu+e7n+eahCBleGNsdWRlX2d1ZXN0IOWxnuaAp+aO
kumZpCBFTDHvvIzogIzlr7nlhbbkuK3nmoQgZXhjbHVkZV9ob3N0Cj4+ICvlsZ7mgKflkIzml7bm
jpLpmaQgRUww77yMRUwy44CC5Zyo6L+b5YWl5ZKM6YCA5Ye65a6i5oi356uv5pe277yM5oiR5Lus
5Lya6YCC5b2T5Zyw5qC55o2uCj4+ICtleGNsdWRlX2hvc3Qg5ZKMIGV4Y2x1ZGVfZ3Vlc3Qg5bGe
5oCn5YyF5ousL+aOkumZpCBFTDDjgIIKPj4gKwo+PiAr5Lul5LiK5aOw5piO5Lmf6YCC55So5LqO
5ZyoIG5vdC1WSEUg5a6i5oi356uv5L2/55So6L+Z5Lqb5bGe5oCn5pe277yM5L2G5piv6K+35rOo
5oSP5a6i5oi356uv5LuOCj4+ICvmnaXkuI3kvJrov5DooYzlnKggRUwy44CCCj4+ICsKPj4gKwo+
PiAr5YeG56Gu5oCnCj4+ICstLS0tLS0KPj4gKwo+PiAr5ZyoIG5vbi1WSEUg5Li75py656uv5LiK
77yM5oiR5Lus5ZyoIEVMMiDov5vlhaUv6YCA5Ye65Li75py656uvL+WuouaIt+err+eahOWIh+aN
ouaXtuWQr+eUqC8KPj4gK+WFs+mXreiuoeaVsOWZqCAt5L2G5piv5Zyo5ZCv55SoL+emgeeUqOiu
oeaVsOWZqOWSjOi/m+WFpS/pgIDlh7rlrqLmiLfnq6/kuYvpl7TlrZjlnKjkuIDmrrXlu7bml7bj
gIIKPj4gK+WvueS6jiBleGNsdWRlX2hvc3TvvIwg5oiR5Lus5Y+v5Lul6YCa6L+H6L+H5rukIEVM
MiDmtojpmaTlnKjlrqLmiLfnq6/ov5vlhaUv6YCA5Ye66L6555WMCj4+ICvkuIrnlKjkuo7orqHm
lbDlrqLmiLfnq6/kuovku7bnmoTkuLvmnLrnq6/kuovku7borqHmlbDlmajjgILkvYbmmK/lvZPk
vb/nlKggIWV4Y2x1ZGVfaHYg5pe277yMCj4+ICvlnKjlrqLmiLfnq6/ov5vlhaUv6YCA5Ye65pyJ
5LiA5Liq5bCP55qE5pqX56qX5Y+j5peg5rOV5o2V6I635Yiw5Li75py656uv55qE5LqL5Lu244CC
Cj4+ICsKPj4gK+WcqFZIReezu+e7n+Wwmuayoeacieaal+eql+WPo+OAggo+PiAKPgo+5pqX56qX
5Y+jIG1heW5vdCB0aGUgYmVzdCwgYnV0IEkgaGF2ZSBubyBiZXR0ZXIgb24gYmxhY2tvdXQgd2lu
ZG93Li4KPgpJcyAi54Gw6Imy55qE56qX5Y+j5pyfIiBiZXR0ZXIgPwo+VGhhbmtzCj5BbGV4CgpU
aGFua3MKQmFpbHUKDQoNCg==
