Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7532EC433EF
	for <linux-doc@archiver.kernel.org>; Tue, 22 Mar 2022 07:44:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiCVHqN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Mar 2022 03:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiCVHqG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Mar 2022 03:46:06 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 596AD79391
        for <linux-doc@vger.kernel.org>; Tue, 22 Mar 2022 00:39:28 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id d3so11896379ilr.10
        for <linux-doc@vger.kernel.org>; Tue, 22 Mar 2022 00:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=94iuB3EsjTHAPts9gz+ZZs3m9FfT2w2Bo+YLcpsiF6k=;
        b=cw2AT4b6zb/aAPJgidwdnt+698pXPrg2EPos9l9aGp4Bm9QCdas7Wn++9cAkH9qqDS
         gmhmurNK0emHiBeOjH5HrDO37Pw0MkLHcBjEmKszV0FNxQDjG/X3Q+1zmeOyKjbcNfL1
         6iMTZPTSKMalf3XGsJrxKohb72d0cV+pY5V3+LvGlexPWo6UD06yruSlwW2iN8DdrVlC
         2CwOvOAvqZp9NwrVSrcC+iw0Kzh+VkHzhyuw7EYO4US+jzRh6kZ2Xdxh8IldhJBEmlOZ
         XP9L3LPl3QAgp+DFpuWzMVGzvzu/aeQ92ylpAVpZSpF3TBc88vQ2UWq8l/IsS4Mi3dyd
         RnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=94iuB3EsjTHAPts9gz+ZZs3m9FfT2w2Bo+YLcpsiF6k=;
        b=hiJjSjG0UAmQ4jUJU2GthTgrpM26J8Pn9SQTeDid4cg9IAZxbqTLhb2Lf7mcxBcFWv
         HYhr5J0944Pq8Ms+cCtPqQGnZsuAP6MNjTMxH1M8SXNXsWeO9s9bBeJ48dgbnUbLWgtb
         rcKjbvpQTaaLaCGqQ5ccgu4w9KSWKkvWLgCQq/OonK7t/vZFOWq7No8KWcMNaE5w2iw7
         XJdNACV2pER9iLyMmtluDW01oMe1cR9sKUh4vUHhYr4w9Od5EU/sOKHlQgbF8RvqEPBj
         6Z2xaAiNq94EQ5u1bCEyheu8f9/I3Ro5w+0+c67Mzaa7rh9gS9j30SzR5ZFRPVh4x8m0
         xKtg==
X-Gm-Message-State: AOAM533DYAyVj5OoHAsRvd4u4oJmmwIfcyQ4rGFL6t0fIk7Z1ZC0AImc
        5NwubDMEIzIN/ywdGFZJ5DaIZrah4JFek0XHznE=
X-Google-Smtp-Source: ABdhPJzen81wilCcNt6MrDmISpkEOF192+NvIXNvJm0x4Y+7RNel0cspfoRSZE9WVCnJo8acXc3Y5HSx5Rc7hJKaEOM=
X-Received: by 2002:a05:6e02:16ca:b0:2c6:7857:a0c4 with SMTP id
 10-20020a056e0216ca00b002c67857a0c4mr12355914ilx.97.1647934767799; Tue, 22
 Mar 2022 00:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1647498763.git.siyanteng@loongson.cn> <47e74b76b6b375d01c1e387f386faa2ef337fc20.1647498763.git.siyanteng@loongson.cn>
In-Reply-To: <47e74b76b6b375d01c1e387f386faa2ef337fc20.1647498763.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Tue, 22 Mar 2022 15:38:51 +0800
Message-ID: <CAJy-AmnqnPjFOXvrVpjG4xbOSRZy7=C5xnNavxRw4HgFmS4aRw@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] docs/zh_CN: add vm z3fold translation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVGh1LCBNYXIgMTcsIDIwMjIgYXQgMjo1MSBQTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmcwMUBn
bWFpbC5jb20+IHdyb3RlOg0KPg0KPiBGcm9tOiBZYW50ZW5nIFNpIDxzaXlhbnRlbmcwMUBnbWFp
bC5jb20+DQo+DQo+IFRyYW5zbGF0ZSAuLi4vdm0vejNmb2xkLnJzdCBpbnRvIENoaW5lc2UuDQo+
DQo+IFNpZ25lZC1vZmYtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4g
LS0tDQo+ICBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QgfCAg
MiArLQ0KPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi92bS96M2ZvbGQucnN0ICAgICAgICAgIHwg
MzEgKysrKysrKysrKysrKysrKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vdm0vejNmb2xkLnJzdA0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vdm0vaW5kZXgucnN0DQo+IGluZGV4IDhjN2QwYjFlNWMzZS4uZTI4
ZDBlOTE5YmZlIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9D
Ti92bS9pbmRleC5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04v
dm0vaW5kZXgucnN0DQo+IEBAIC0zNyw2ICszNyw3IEBAIFRPRE865b6F5byV55So5paH5qGj6ZuG
6KKr57+76K+R5a6M5q+V5ZCO6K+35Y+K5pe25L+u5pS55q2k5aSE77yJDQo+ICAgICBwYWdlX3Rh
YmxlX2NoZWNrDQo+ICAgICByZW1hcF9maWxlX3BhZ2VzDQo+ICAgICBzcGxpdF9wYWdlX3RhYmxl
X2xvY2sNCj4gKyAgIHozZm9sZA0KPg0KPiAgVE9ET0xJU1Q6DQo+ICAqIGFyY2hfcGd0YWJsZV9o
ZWxwZXJzDQo+IEBAIC00OSw1ICs1MCw0IEBAIFRPRE9MSVNUOg0KPiAgKiB0cmFuc2h1Z2UNCj4g
ICogdW5ldmljdGFibGUtbHJ1DQo+ICAqIHZtYWxsb2NlZC1rZXJuZWwtc3RhY2tzDQo+IC0qIHoz
Zm9sZA0KPiAgKiB6c21hbGxvYw0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvemhfQ04vdm0vejNmb2xkLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL3ZtL3ozZm9sZC5yc3QNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAw
MDAwMDAwLi5mZDBmMWFjODUwZDcNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9Eb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS96M2ZvbGQucnN0DQo+IEBAIC0wLDAgKzEsMzEgQEAN
Cj4gKzpPcmlnaW5hbDogRG9jdW1lbnRhdGlvbi92bS96M2ZvbGQucnN0DQo+ICsNCj4gKzrnv7vo
r5E6DQo+ICsNCj4gKyDlj7jlu7bohb4gWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNu
Pg0KPiArDQo+ICs65qCh6K+ROg0KPiArDQo+ICsNCj4gKz09PT09PQ0KPiArejNmb2xkDQo+ICs9
PT09PT0NCj4gKw0KPiArejNmb2xk5piv5LiA5Liq5LiT6Zeo55So5LqO5a2Y5YKo5Y6L57yp6aG1
55qE5YiG6YWN5Zmo44CC5a6D6KKr6K6+6K6h5Li65q+P5Liq54mp55CG6aG15pyA5aSa5Y+v5Lul
5a2Y5YKo5LiJ5Liq5Y6L57yp6aG144CCDQo+ICvlroPmmK96YnVk55qE6KGN55Sf54mp77yM5YWB
6K645pu06auY55qE5Y6L57yp546H77yM5L+d5oyB5YW25YmN6L6I55qE566A5Y2V5oCn5ZKM56Gu
5a6a5oCn44CCDQo+ICsNCj4gK3ozZm9sZOWSjHpidWTnmoTkuLvopoHljLrliKvmmK86DQo+ICsN
Cj4gKyog5LiOemJ1ZOS4jeWQjOeahOaYr++8jHozZm9sZOWFgeiuuOacgOWkp+eahFBBR0VfU0la
ReWIhumFjeOAgg0KPiArKiB6M2ZvbGTlnKjlhbbpobXpnaLkuK3mnIDlpJrlj6/ku6XlrrnnurMz
5Liq5Y6L57yp6aG16Z2iDQo+ICsqIHozZm9sZOacrOi6q+ayoeaciei+k+WHuuS7u+S9lUFQSe+8
jOWboOatpOaJk+eul+mAmui/h3pwb29s55qEQVBJ5p2l5L2/55SoDQo+ICsNCj4gK+S4uuS6huS/
neaMgeehruWumuaAp+WSjOeugOWNleaAp++8jHozZm9sZO+8jOWwseWDj3pidWTkuIDmoLfvvIzm
gLvmmK/lnKjmr4/pobXlrZjlgqjkuIDkuKrmlbTmlbDnmoTljovnvKnpobXvvIzkvYbmmK8NCj4g
K+Wug+acgOWkmuWPr+S7peWtmOWCqDPpobXvvIzkuI3lg496YnVk5pyA5aSa5Y+v5Lul5a2Y5YKo
MumhteOAguWboOatpOWOi+e8qeeOh+i+vuWIsDIuN+WAjeW3puWPs++8jOiAjHpidWTnmoTljovn
vKkNCj4gK+eOh+aYrzEuN+WAjeW3puWPs+OAgg0KPiArDQo+ICvkuI3lg496YnVk77yI5L2G5Lmf
5YOPenNtYWxsb2PvvInvvIx6M2ZvbGRfYWxsb2MoKemCo+agt+S4jei/lOWbnuS4gOS4quWPr+mH
jeWkjeW8leeUqOeahOaMh+mSiOOAguebuOWPje+8jOWugw0KPiAr6L+U5Zue5LiA5Liq5peg56ym
5Y+36ZW/5Y+l5p+E77yM5a6D57yW56CB5LqG6KKr5YiG6YWN5a+56LGh55qE5a6e6ZmF5L2N572u
44CCDQo+ICsNCj4gK+S/neaMgeacieaViOeahOWOi+e8qeeOh+aOpei/keS6jnpzbWFsbG9j77yM
ejNmb2xk5LiN5L6d6LWW5LqOTU1V55qE5ZCv55So77yM5bm25o+Q5L6b5pu05Y+v6aKE5rWL55qE
5Zue5pS26KGMDQo+ICvkuLrvvIzov5nkvb/lvpflroPmm7TpgILlkIjkuo7lsI/lnovlkozlk43l
upTlhbPplK7nmoTns7vnu5/jgIINCg0KcmVzcG9uc2UtY3JpdGljYWzvvIxndWVzcyBpdCBtZWFu
cyBxdWljayByZXNwb25zZSByZXF1aXJlZCBzeXN0ZW0uIHNvIOWPjeW6lOi/hemAn+eahD8NCg0K
UmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxhbGV4c0BrZXJuZWwub3JnPg0KDQo+IC0tDQo+IDIuMjcu
MA0KPg0K
