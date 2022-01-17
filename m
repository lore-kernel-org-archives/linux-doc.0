Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A04C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 17 Jan 2022 05:09:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbiAQFJ6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Jan 2022 00:09:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiAQFJ6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Jan 2022 00:09:58 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D524AC061574
        for <linux-doc@vger.kernel.org>; Sun, 16 Jan 2022 21:09:57 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id w7so14974767ioj.5
        for <linux-doc@vger.kernel.org>; Sun, 16 Jan 2022 21:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6QdSCkKrD2roSKkOykhPzgwepmNbgtT34Zjs74c/vwo=;
        b=amj9vFSmcW66jg6HqBVQ3a+YrfOUA2uScd/YZFg0/bQox2Drgk1e70T9BaokvPGKKN
         Oc/WZPvVxlKiL8Eu+WlcTlWdA3RQxhSVf6OaySzJp4sgFn/gFXtBsIMxZ/SbdRrntCAm
         mAA1XAIMvOCGVxn7Alauwf+a0fz1naRiDirlBXf1MdW4Ww6qvA5Av6tKgsnJJrqHfvRF
         Kdfrke2Zk9kh8uoKYnl86XfaoH9wgEGeYyzeFb1RgYlbwU7ycUAwMNMCH6OUOwTMvgy0
         u0ilRPv7ic4XOgHxNNPHqV8bx0o2rkK6CwjaXxiBTuzSgEJ2vAotIosaqoYFn2BWjtrT
         ghWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6QdSCkKrD2roSKkOykhPzgwepmNbgtT34Zjs74c/vwo=;
        b=oS3u7h5nGfyPwL6KAbTEcAzHvfB1fFvz284P6dmYJyty0UShnkDpIzGU4vc4SzDr6P
         DSXj0RGvcLo0JDXgQrwZ+MtBBDDe53R5oSie5RqOS0N8HpXaipqIMc77T6KDF6y0UV/S
         AvVHsDrCsBHvMcKuIlAo+kqN/8gsR6PbZAH49LeMis+oiSWnJDCBptYyog1rSIZkienh
         CmXpazC5hdq6BSfuUsKVh8ZCkPZy1gSlfYHmncw//ETQyKsAT6udo1um9xuEzcr4Zw9o
         8RlxCkWcKP+M7c08iFsJcz9ZtkJ/e4MZSxBSaZtD/eTAf1zyeTOax+OAO/Ywwq8khL2x
         hTCg==
X-Gm-Message-State: AOAM5308FzYh7905vWdLnHYQbJh/W4tnaB3Az85iG4+lcs/MjyfDyHyG
        W0VlSdPZIeA3nWqyhFUdCamsQ+TfwEVtFOvlYXu1gjVc1f4=
X-Google-Smtp-Source: ABdhPJx3nMx0QFHKm2TrU7yNusQJDuZZzrjgiHXlxkXOTfk4gWWfe9aIbOhyIaZIPRtZRBf4RWaFMa17CRcj0GqAbaA=
X-Received: by 2002:a05:6602:2b83:: with SMTP id r3mr9591580iov.93.1642396197255;
 Sun, 16 Jan 2022 21:09:57 -0800 (PST)
MIME-Version: 1.0
References: <20220117043455.861550-1-xu.xin16@zte.com.cn> <20220117043813.861663-1-xu.xin16@zte.com.cn>
In-Reply-To: <20220117043813.861663-1-xu.xin16@zte.com.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Mon, 17 Jan 2022 13:09:21 +0800
Message-ID: <CAJy-Amnj0p6UA7Ew13ye_X3mLYK0jQsKQut6gXJHXmbJ6UE+Lw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] zh_CN: Add Chinese translation for vm/ksm.rst
To:     CGEL <cgel.zte@gmail.com>
Cc:     YanTeng Si <sterlingteng@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        yanteng si <siyanteng01@gmail.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        xu.xin16@zte.com.cn, Yang Yang <yang.yang29@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gTW9uLCBKYW4gMTcsIDIwMjIgYXQgMTI6MzggUE0gPGNnZWwuenRlQGdtYWlsLmNvbT4gd3Jv
dGU6DQo+DQo+IEZyb206IHh1IHhpbiA8eHUueGluMTZAenRlLmNvbS5jbj4NCj4NCj4gVHJhbnNs
YXRlIERvY3VtZW50YXRpb24vdm0va3NtLnJzdCBpbnRvIENoaW5lc2UuDQo+IFVwZGF0ZSBEb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QuDQo+DQo+IFJldmlld2Vk
LWJ5OiBZYW5nIFlhbmcgPHlhbmcueWFuZzI5QHp0ZS5jb20uY24+DQo+IFNpZ25lZC1vZmYtYnk6
IHh1IHhpbiA8eHUueGluMTZAenRlLmNvbS5jbj4NCg0KUmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxh
bGV4c0BrZXJuZWwub3JnPg0KDQo+IC0tLQ0KPiAgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vdm0vaW5kZXgucnN0IHwgIDEgKw0KPiAgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vdm0va3NtLnJzdCAgIHwgNzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9rc20ucnN0DQo+DQo+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QgYi9Eb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QNCj4gaW5kZXggNmIwOTkw
Yy4uYzg3NGUyZSAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhf
Q04vdm0vaW5kZXgucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L3ZtL2luZGV4LnJzdA0KPiBAQCAtMjQsNiArMjQsNyBAQCBUT0RPOuW+heW8leeUqOaWh+aho+mb
huiiq+e/u+ivkeWujOavleWQjuivt+WPiuaXtuS/ruaUueatpOWkhO+8iQ0KPiAgICAgYWN0aXZl
X21tDQo+ICAgICBiYWxhbmNlDQo+ICAgICBkYW1vbi9pbmRleA0KPiArICAga3NtDQo+DQo+ICBU
T0RPTElTVDoNCj4gICogYWN0aXZlX21tDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3Ry
YW5zbGF0aW9ucy96aF9DTi92bS9rc20ucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vdm0va3NtLnJzdA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAw
Li5lZjY2Y2Q0DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvemhfQ04vdm0va3NtLnJzdA0KPiBAQCAtMCwwICsxLDcwIEBADQo+ICsuLiBpbmNsdWRl
OjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gKw0KPiArOk9yaWdpbmFsOiBEb2N1bWVudGF0
aW9uL3ZtL2tzbS5yc3QNCj4gKw0KPiArOue/u+ivkToNCj4gKw0KPiArICAg5b6Q6ZGrIHh1IHhp
biA8eHUueGluMTZAenRlLmNvbS5jbj4NCj4gKw0KPiArPT09PT09PT09PT09DQo+ICvlhoXmoLjl
kIzpobXlkIjlubYNCj4gKz09PT09PT09PT09PQ0KPiArDQo+ICtLU00g5piv5LiA56eN6IqC55yB
5YaF5a2Y55qE5pWw5o2u5Y676YeN5Yqf6IO977yM55SxQ09ORklHX0tTTT155ZCv55So77yM5bm2
5ZyoMi42LjMy54mI5pys5pe26KKr5re75YqgDQo+ICvliLBMaW51eOWGheaguOOAguivpuingSBg
YG1tL2tzbS5jYGAg55qE5a6e546w77yM5Lul5Y+KaHR0cDovL2x3bi5uZXQvQXJ0aWNsZXMvMzA2
NzA05ZKMDQo+ICtodHRwczovL2x3bi5uZXQvQXJ0aWNsZXMvMzMwNTg5DQo+ICsNCj4gK0tTTeea
hOeUqOaIt+epuumXtOeahOaOpeWPo+WcqERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L2FkbWluLWd1aWRlL21tL2tzbS5yc3QNCj4gK+aWh+aho+S4reacieaPj+i/sOOAgg0KPiArDQo+
ICvorr7orqENCj4gKz09PT0NCj4gKw0KPiAr5qaC6L+wDQo+ICstLS0tDQo+ICsNCj4gK+amgui/
sOWGheWuueivt+ingW1tL2tzbS5j5paH5qGj5Lit55qE4oCcRE9DOiBPdmVydmlld+KAnQ0KPiAr
DQo+ICvpgIbmmKDlsIQNCj4gKy0tLS0tLQ0KPiArS1NN57u05oqk552A56iz5a6a5qCR5Lit55qE
S1NN6aG155qE6YCG5pig5bCE5L+h5oGv44CCDQo+ICsNCj4gK+W9k0tTTemhtemdoueahOWFseS6
q+aVsOWwj+S6jiBgYG1heF9wYWdlX3NoYXJpbmdgYCDnmoTomZrmi5/lhoXlrZjljLrln58oVk1B
cynml7bvvIzliJnku6PooajkuoYNCj4gK0tTTemhteeahOeos+WumuagkeWFtuS4reeahOiKgueC
ueaMh+WQkeS6huS4gOS4qnJtYXBfaXRlbee7k+aehOS9k+exu+Wei+eahOWIl+ihqOOAguWQjOaX
tu+8jOi/meS4qktTTemhtQ0KPiAr55qEIGBgcGFnZS0+bWFwcGluZ2BgIOaMh+WQkeS6huivpeeo
s+WumuagkeiKgueCueOAgg0KPiArDQo+ICvlpoLmnpzlhbHkuqvmlbDotoXov4fkuobpmIjlgLzv
vIxLU03lsIbnu5nnqLPlrprmoJHmt7vliqDnrKzkuozkuKrnu7TluqbjgILnqLPlrprmoJHlsLHl
j5jmiJDpk77mjqXkuIDkuKrmiJblpJoNCj4gK+S4queos+WumuagkSLlia/mnKwi55qEIumTviLj
gILmr4/kuKrlia/mnKzpg73kv53nlZlLU03pobXnmoTpgIbmmKDlsITkv6Hmga/vvIzlhbbkuK0g
YGBwYWdlLT5tYXBwaW5nYGANCj4gK+aMh+WQkeivpSLlia/mnKwi44CCDQo+ICsNCj4gK+avj+S4
qumTvuS7peWPiumTvuaOpeWIsOivpemTvuS4reeahOaJgOaciSLlia/mnKwi5by65Yi25LiN5Y+Y
55qE5piv77yM5a6D5Lus5Luj6KGo5LqG55u45ZCM55qE5YaZ5L+d5oqk5YaF5a2YDQo+ICvlhoXl
rrnvvIzlsL3nrqHku7vkuK3kuIDkuKoi5Ymv5pysIuaYr+eUseWQjOS4gOeJh+WGheWtmOWMuuea
hOS4jeWQjOeahEtTTeWkjeWItumhteaJgOaMh+WQkeeahOOAgg0KPiArDQo+ICvov5nmoLfkuIDm
naXvvIznm7jmr5TkuI7ml6DpmZDnmoTpgIbmmKDlsITpk77ooajvvIznqLPlrprmoJHnmoTmn6Xm
ib7orqHnrpflpI3mnYLmgKfkuI3lj5flvbHlk43jgILkvYblnKjnqLPlrprmoJENCj4gK+acrOi6
q+S4reS4jeiDveaciemHjeWkjeeahEtTTemhtemdouWGheWuueS7jeeEtuaYr+W8uuWItuimgeax
guOAgg0KPiArDQo+ICvnlLEgYGBtYXhfcGFnZV9zaGFyaW5nYGAg5by65Yi25Yaz5a6a55qE5pWw
5o2u5Y676YeN6ZmQ5Yi25piv5b+F6KaB55qE77yM5Lul5q2k5p2l6YG/5YWN6Jma5ouf5YaF5a2Y
DQo+ICtybWFw6ZO+6KGo5Y+Y5b6X6L+H5aSn44CCcm1hcOeahOmBjeWOhuWFt+aciU8oTinnmoTl
pI3mnYLluqbvvIzlhbbkuK1O5piv5YWx5Lqr6aG16Z2i55qEcm1hcF/pobnvvIjljbMNCj4gK+iZ
muaLn+aYoOWwhO+8ieeahOaVsOmHj++8jOiAjOi/meS4quWFseS6q+mhtemdoueahOiKgueCueaV
sOmHj+WPiOiiqyBgYG1heF9wYWdlX3NoYXJpbmdgYCDmiYDpmZDliLbjgIINCj4gK+WboOatpO+8
jOi/meacieaViOWcsOWwhue6v+aAp08oTinorqHnrpflpI3mnYLluqbku45ybWFw6YGN5Y6G5Lit
5YiG5pWj5Yiw5LiN5ZCM55qES1NN6aG16Z2i5LiK44CCa3NtZOi/mw0KPiAr56iL5Zyo56iz5a6a
6IqC54K5IumTviLkuIrnmoTpgY3ljobkuZ/mmK9PKE4p77yM5L2G6L+Z5LiqTuaYr+eos+Wumuag
kSLlia/mnKwi55qE5pWw6YeP77yM6ICM5LiN5pivcm1hcOmhuQ0KPiAr55qE5pWw6YeP77yM5Zug
5q2k5a6D5a+5a3NtZOaAp+iDveayoeacieaYvuiRl+W9seWTjeOAguWunumZheS4iu+8jOacgOS9
s+eos+WumuagkSLlia/mnKwi55qE5YCZ6YCJ6IqC54K55bCGDQo+ICvkv53nlZnlnKgi5Ymv5pys
IuWIl+ihqOeahOW8gOWktOOAgg0KPiArDQo+ICtgYG1heF9wYWdlX3NoYXJpbmdgYCDnmoTlgLzo
rr7nva7lvpfpq5jkuobkvJrkv4Pkvb/mm7Tlv6vnmoTlhoXlrZjlkIjlubbvvIjlm6DkuLrlsIbm
nInmm7TlsJHnmoTnqLPlrpoNCj4gK+agkeWJr+acrOaOkumYn+i/m+WFpeeos+WumuiKgueCuWNo
YWluLT5obGlzdO+8ieWSjOabtOmrmOeahOaVsOaNruWOu+mHjeezu+aVsO+8jOS9huS7o+S7t+aY
r+WcqOS6pOaNouOAgeWOiw0KPiAr57yp44CBTlVNQeW5s+ihoeWSjOmhtemdoui/geenu+i/h+eo
i+S4reWPr+iDveWvvOiHtEtTTemhteeahOacgOWkp3JtYXDpgY3ljobpgJ/luqbovoPmhaLjgIIN
Cj4gKw0KPiArYGBzdGFibGVfbm9kZV9kdXBzL3N0YWJsZV9ub2RlX2NoYWluc2BgIOeahOavlOWA
vOi/mOWPlyBgYG1heF9wYWdlX3NoYXJpbmdgYCDosIPmjqcNCj4gK+eahOW9seWTje+8jOmrmOav
lOWAvOWPr+iDveaEj+WRs+edgOeos+WumuiKgueCuWR1cOS4reWtmOWcqOeijueJh++8jOi/meWP
r+S7pemAmui/h+WcqGtzbWTkuK3lvJXlhaXnoo7niYfnrpcNCj4gK+azleadpeino+WGs++8jOiv
peeul+azleWwhnJtYXDpobnku47kuIDkuKrnqLPlrproioLngrlkdXDph43lrprkvY3liLDlj6bk
uIDkuKrnqLPlrproioLngrlkdXDvvIzku6Xkvr/ph4rmlL4NCj4gK+mCo+S6m+S7heWMheWQq+ae
geWwkXJtYXDpobnnmoTnqLPlrproioLngrkiZHVwIu+8jOS9hui/meWPr+iDveS8muWinuWKoGtz
bWTov5vnqIvnmoRDUFXkvb/nlKjnjofvvIzlubblj68NCj4gK+iDveS8muWHj+aFouW6lOeUqOeo
i+W6j+WcqEtTTemhtemdouS4iueahOWPquivu+iuoeeul+OAgg0KPiArDQo+ICtLU03kvJrlrprm
nJ/miavmj4/nqLPlrproioLngrki6ZO+IuS4remTvuaOpeeahOaJgOacieeos+WumuagkSLlia/m
nKwi77yM5Lul5L6/5Yig5YeP6L+H5pe25LqG55qE56iz5a6a6IqC54K544CCDQo+ICvov5nnp43m
iavmj4/nmoTpopHnjofnlLEgYGBzdGFibGVfbm9kZV9jaGFpbnNfcHJ1bmVfbWlsbGlzZWNzYGAg
6L+Z5Liqc3lzZnMg5o6l5Y+j5a6a5LmJ44CCDQo+ICsNCj4gK+WPguiAgw0KPiArPT09PQ0KPiAr
5YaF5qC45Luj56CB6K+36KeBbW0va3NtLmPjgIINCj4gK+a2ieWPiueahOWHveaVsChtbV9zbG90
ICBrc21fc2NhbiAgc3RhYmxlX25vZGUgIHJtYXBfaXRlbSnjgIINCj4gLS0NCj4gMi4xNS4yDQo=
