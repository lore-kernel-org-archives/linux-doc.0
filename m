Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2653C38A2D
	for <linux-doc@archiver.kernel.org>; Mon, 24 Oct 2022 11:19:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbiJXLTH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 Oct 2022 07:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230221AbiJXLTA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Oct 2022 07:19:00 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1A2FB5FC2C
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 04:18:57 -0700 (PDT)
Received: from loongson.cn (unknown [112.20.109.239])
        by gateway (Coremail) with SMTP id _____8Cxq9igdFZjRR0CAA--.8283S3;
        Mon, 24 Oct 2022 19:18:56 +0800 (CST)
Received: from zhoubinbin$loongson.cn ( [112.20.109.239] ) by
 ajax-webmail-localhost.localdomain (Coremail) ; Mon, 24 Oct 2022 19:18:56
 +0800 (GMT+08:00)
X-Originating-IP: [112.20.109.239]
Date:   Mon, 24 Oct 2022 19:18:56 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   =?UTF-8?B?5ZGo5b2s5b2s?= <zhoubinbin@loongson.cn>
To:     "Alex Shi" <seakeel@gmail.com>
Cc:     "Jonathan Corbet" <corbet@lwn.net>, "Alex Shi" <alexs@kernel.org>,
        "Yanteng Si" <siyanteng@loongson.cn>,
        "Wu XiangCheng" <bobwxc@email.cn>,
        "Huacai Chen" <chenhuacai@loongson.cn>, linux-doc@vger.kernel.org
Subject: Re: Re: [PATCH RESEND V2 3/3] docs/zh_CN: core-api: Add errseq
 Chinese translation
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20220411(feba7c69)
 Copyright (c) 2002-2022 www.mailtech.cn .loongson.cn
In-Reply-To: <CAJy-Am=mtZxQv2AgH+PxVLsJ8FeW1NRQV2bkLD1RRLGQLxUPgQ@mail.gmail.com>
References: <cover.1666171735.git.zhoubinbin@loongson.cn>
 <bd81bd620eb6c64effd2d0d52831f39911fc1659.1666171735.git.zhoubinbin@loongson.cn>
 <CAJy-Amm-qK5NU=bourLGQ-A7G3ST1NDdu-KrK4eomZMdjNWYBw@mail.gmail.com>
 <64c6dc26-8dae-69c2-2c6d-c6ebaa170060@loongson.cn>
 <CAJy-Am=mtZxQv2AgH+PxVLsJ8FeW1NRQV2bkLD1RRLGQLxUPgQ@mail.gmail.com>
Content-Transfer-Encoding: base64
X-CM-CTRLDATA: EOVGFWZvb3Rlcl90eHQ9MTA4MTo2MTI=
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <b12282e.2c4e.18409b79130.Coremail.zhoubinbin@loongson.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAf8Axz1egdFZjNVQEAA--.1210W
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQAJCGNVLuIR5QADsN
X-Coremail-Antispam: 1Uk129KBjvJXoW7Cw1rGw17WFWUJrykWry7trb_yoW8Gryxpr
        Wayw4fCFsrX34j9r4qkFy2yF1aq3s5Xw4DCFWkKwn7A3Z8C390qF4Syw1j9rW7Ar92gr13
        Xws7Zrn09FWjyrJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bS8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
        x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
        xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
        kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm
        72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFcxC0VAYjxAxZF0Ew4CEw7xC0w
        ACY4xI67k04243AVC20s07MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
        MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
        AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
        cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
        80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JwCE64xvF2IEb7IF0Fy7
        YxBIdaVFxhVjvjDU0xZFpf9x07jo7KsUUUUU=
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

CgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiQWxleCBTaGkiIDxzZWFr
ZWVsQGdtYWlsLmNvbT4KPiDlj5HpgIHml7bpl7Q6MjAyMi0xMC0yNCAxNjozNzowMCAo5pif5pyf
5LiAKQo+IOaUtuS7tuS6ujogIkJpbmJpbiBaaG91IiA8emhvdWJpbmJpbkBsb29uZ3Nvbi5jbj4K
PiDmioTpgIE6ICJKb25hdGhhbiBDb3JiZXQiIDxjb3JiZXRAbHduLm5ldD4sICJBbGV4IFNoaSIg
PGFsZXhzQGtlcm5lbC5vcmc+LCAiWWFudGVuZyBTaSIgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4s
ICJXdSBYaWFuZ0NoZW5nIiA8Ym9id3hjQGVtYWlsLmNuPiwgIkh1YWNhaSBDaGVuIiA8Y2hlbmh1
YWNhaUBsb29uZ3Nvbi5jbj4sIGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmcKPiDkuLvpopg6IFJl
OiBbUEFUQ0ggUkVTRU5EIFYyIDMvM10gZG9jcy96aF9DTjogY29yZS1hcGk6IEFkZCBlcnJzZXEg
Q2hpbmVzZSB0cmFuc2xhdGlvbgo+IAo+IE9uIFNhdCwgT2N0IDIyLCAyMDIyIGF0IDExOjA5IFBN
IEJpbmJpbiBaaG91IDx6aG91YmluYmluQGxvb25nc29uLmNuPiB3cm90ZToKPiAKPiAKPiA+ID4g
SG9uc3RseSwgSSBkb24ndCB1bmRlcnN0YW5kIHRoZSBtZWFuaW5nIG9mIHRoaXMgd29yZHMuIDov
Cj4gPgo+ID4gQWNjb3JkaW5nIHRvIHRoZSBzcGVjaWZpYyBpbXBsZW1lbnRhdGlvbiBvZiB0aGUg
ZnVuY3Rpb24sIHdoYXQgd2Ugd2FudAo+ID4gdG8gdHJhY2sgaXMgdGhlIGVycm9yIGFmdGVyIHRo
ZSBzYW1wbGluZyBwb2ludCBgYHNpbmNlYGAgLCBzbyB0aGUKPiA+IGBgc2luY2VgYCB2YXJpYWJs
ZSBpcyBvbmx5IHVzZWQgZm9yIGNvbXBhcmlzb24gYW5kIHdpbGwgYmUgZGlzY2FyZGVkIGxhdGVy
Lgo+ID4KPiA+IEhvdyBhYm91dO+8mgo+ID4g55Sx5LqO5LuW5Y+q5piv5Zyo6YeH5qC354K55ZCO
5Lii5byDIGBgc2luY2VgYCDlj5jph4/vvIzmiYDku6XkuI3pnIDopoHlnKjov5nph4zkv53lrZjm
m7TmlrDlroPjgIIKPiA+Cj4gCj4gR2V0IGl0LiBpZiBzbywgY291bGQgd2UgZ2l2ZSBhIGJpdCBt
b3JlIGluZm/vvJ8gbGlrZToKPiDnlLHkuo7ku5blj6rmmK/lnKjph4fmoLfngrnlkI7kuKLlvIMg
YGBzaW5jZWBgIOWPmOmHjyhzaW5jZSDml6LmmK/ph4fmoLfngrkp77yM5omA5Lul5LiN6ZyA6KaB
5Zyo6L+Z6YeM5L+d5a2Y5pu05paw5a6D44CCCgpPSy4gSSBnZXQgaXQsIGFuZCBJIHdpbGwgc2Vu
ZCB0aGUgVjMgcGF0Y2hzZXQuCgpUaGFua3MuCgpCaW5iaW4KCj4gCj4gVGhhbmtzCj4gQWxleAoN
Cg0K5pys6YKu5Lu25Y+K5YW26ZmE5Lu25ZCr5pyJ6b6Z6Iqv5Lit56eR55qE5ZWG5Lia56eY5a+G
5L+h5oGv77yM5LuF6ZmQ5LqO5Y+R6YCB57uZ5LiK6Z2i5Zyw5Z2A5Lit5YiX5Ye655qE5Liq5Lq6
5oiW576k57uE44CC56aB5q2i5Lu75L2V5YW25LuW5Lq65Lul5Lu75L2V5b2i5byP5L2/55So77yI
5YyF5ous5L2G5LiN6ZmQ5LqO5YWo6YOo5oiW6YOo5YiG5Zyw5rOE6Zyy44CB5aSN5Yi25oiW5pWj
5Y+R77yJ5pys6YKu5Lu25Y+K5YW26ZmE5Lu25Lit55qE5L+h5oGv44CC5aaC5p6c5oKo6ZSZ5pS2
5pys6YKu5Lu277yM6K+35oKo56uL5Y2z55S16K+d5oiW6YKu5Lu26YCa55+l5Y+R5Lu25Lq65bm2
5Yig6Zmk5pys6YKu5Lu244CCIA0KVGhpcyBlbWFpbCBhbmQgaXRzIGF0dGFjaG1lbnRzIGNvbnRh
aW4gY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIGZyb20gTG9vbmdzb24gVGVjaG5vbG9neSAsIHdo
aWNoIGlzIGludGVuZGVkIG9ubHkgZm9yIHRoZSBwZXJzb24gb3IgZW50aXR5IHdob3NlIGFkZHJl
c3MgaXMgbGlzdGVkIGFib3ZlLiBBbnkgdXNlIG9mIHRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQg
aGVyZWluIGluIGFueSB3YXkgKGluY2x1ZGluZywgYnV0IG5vdCBsaW1pdGVkIHRvLCB0b3RhbCBv
ciBwYXJ0aWFsIGRpc2Nsb3N1cmUsIHJlcHJvZHVjdGlvbiBvciBkaXNzZW1pbmF0aW9uKSBieSBw
ZXJzb25zIG90aGVyIHRoYW4gdGhlIGludGVuZGVkIHJlY2lwaWVudChzKSBpcyBwcm9oaWJpdGVk
LiBJZiB5b3UgcmVjZWl2ZSB0aGlzIGVtYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBz
ZW5kZXIgYnkgcGhvbmUgb3IgZW1haWwgaW1tZWRpYXRlbHkgYW5kIGRlbGV0ZSBpdC4g

