Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A333C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 20 Jan 2022 02:25:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358210AbiATCZz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Jan 2022 21:25:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358204AbiATCZz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Jan 2022 21:25:55 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CDE9C061574
        for <linux-doc@vger.kernel.org>; Wed, 19 Jan 2022 18:25:55 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id v11-20020a17090a520b00b001b512482f36so1605508pjh.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Jan 2022 18:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1XVMkUvUVlXr3PcbG1CKIXfq8o684qB5Zys2n3C7Fl0=;
        b=FivSRtAvaswGsXu0Dq3Cp+k67mEJ/Ks27MGKTw5tIlSi4a9VKCmG0bZazKPLoGuZzX
         TlErBhHT4cIb342e+h9zkRXvA7GAlHQEGyNgVPThH/pzSGbKmx2YxQcji4hoeuCf+a4W
         aoQ0PAi7wuDsIslIvDUPZM+i6Xf9H2ekGVy5X+3Mp8WzN6wPhlYFlyQPiX7drdQTZJ3P
         zQnCDQkTHUZt1NFYQnwrIZK/BGHzUVrA3fFNFrThuwsfnX5eUq45L2Iy8zsAVKb3zl4F
         tG5+aJXArsi3L1UTZx897w2NTJvVN/9cQL+GtGaqJiKnc5lh9dRXvD8zjbwZedxCiaXx
         2i7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1XVMkUvUVlXr3PcbG1CKIXfq8o684qB5Zys2n3C7Fl0=;
        b=uT+SVYV4sbG4B50SRuObP3NTVeFGHEuR8i/6yaxVB0TgsODthG0YWV0XBWI7BQrV5O
         I31vPRTsjCBdvlgZ/h1noPZZPnybmEO8KLuYfYXciqT0wPqxsMy/P4vT0AYzcrKmO2YJ
         /GRanDNPj/bFv4HTQlU1n0qs2xMEKxUic6qOdZ3a19jPfjJNh1bFOLNF6e/qv2H0zMrm
         UUfzDKllXgNht24+gErp90UInLAUUR+gubMCa26+qJXfdUeM6oZ9g9mnHFJ6rIgsXWgc
         0EPPWY8JHbTgZn0eP0H8pxVQSHMJb1Yu2IZJk9ooPXFSUDPOZo9NjTyOhn0Iwd6BLKxQ
         50ZA==
X-Gm-Message-State: AOAM531jXzAUlbRVqH7wxNnxRnfjNQesTFgh111X6WS4iNBvsdIqk4Mo
        MauSEnOnf8RYCj03pr9rNltVvLWo8sr27B4InN3G6uVcJ1H7EP6h
X-Google-Smtp-Source: ABdhPJzVkq95VLg8Wxvb20+aUEOApNoEVbzR7o+04LWwPFsou0cwOCxODI+YpdFjUR6KoBSoG8s+LyFP6MuceqeNs9o=
X-Received: by 2002:a17:90b:2246:: with SMTP id hk6mr7909052pjb.27.1642645554611;
 Wed, 19 Jan 2022 18:25:54 -0800 (PST)
MIME-Version: 1.0
References: <20220117043455.861550-1-xu.xin16@zte.com.cn> <20220117043813.861663-1-xu.xin16@zte.com.cn>
In-Reply-To: <20220117043813.861663-1-xu.xin16@zte.com.cn>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Thu, 20 Jan 2022 10:25:46 +0800
Message-ID: <CAMU9jJpaN+T_ndizVUOF8MAaboLujxtXsJb_PvRUMaF0UthLAw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] zh_CN: Add Chinese translation for vm/ksm.rst
To:     CGEL <cgel.zte@gmail.com>
Cc:     Alex Shi <seakeel@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
        Yanteng Si <siyanteng01@gmail.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        xu.xin16@zte.com.cn, Yang Yang <yang.yang29@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

PGNnZWwuenRlQGdtYWlsLmNvbT4g5LqOMjAyMuW5tDHmnIgxN+aXpeWRqOS4gCAxMjozOOWGmemB
k++8mg0KPg0KPiBGcm9tOiB4dSB4aW4gPHh1LnhpbjE2QHp0ZS5jb20uY24+DQo+DQo+IFRyYW5z
bGF0ZSBEb2N1bWVudGF0aW9uL3ZtL2tzbS5yc3QgaW50byBDaGluZXNlLg0KPiBVcGRhdGUgRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vaW5kZXgucnN0Lg0KPg0KPiBSZXZpZXdl
ZC1ieTogWWFuZyBZYW5nIDx5YW5nLnlhbmcyOUB6dGUuY29tLmNuPg0KPiBTaWduZWQtb2ZmLWJ5
OiB4dSB4aW4gPHh1LnhpbjE2QHp0ZS5jb20uY24+DQpSZXZpZXdlZC1ieTogWWFudGVuZyBTaSA8
c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KDQpUaGFua3MsDQpZYW50ZW5nDQo+IC0tLQ0KPiAgRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vaW5kZXgucnN0IHwgIDEgKw0KPiAgRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0va3NtLnJzdCAgIHwgNzAgKysrKysrKysr
KysrKysrKysrKysrKysrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKykN
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92
bS9rc20ucnN0DQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96
aF9DTi92bS9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9p
bmRleC5yc3QNCj4gaW5kZXggNmIwOTkwYy4uYzg3NGUyZSAxMDA2NDQNCj4gLS0tIGEvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vaW5kZXgucnN0DQo+ICsrKyBiL0RvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2luZGV4LnJzdA0KPiBAQCAtMjQsNiArMjQsNyBA
QCBUT0RPOuW+heW8leeUqOaWh+aho+mbhuiiq+e/u+ivkeWujOavleWQjuivt+WPiuaXtuS/ruaU
ueatpOWkhO+8iQ0KPiAgICAgYWN0aXZlX21tDQo+ICAgICBiYWxhbmNlDQo+ICAgICBkYW1vbi9p
bmRleA0KPiArICAga3NtDQo+DQo+ICBUT0RPTElTVDoNCj4gICogYWN0aXZlX21tDQo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9rc20ucnN0IGIvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0va3NtLnJzdA0KPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwLi5lZjY2Y2Q0DQo+IC0tLSAvZGV2L251bGwNCj4gKysr
IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0va3NtLnJzdA0KPiBAQCAtMCww
ICsxLDcwIEBADQo+ICsuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gKw0K
PiArOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL3ZtL2tzbS5yc3QNCj4gKw0KPiArOue/u+ivkToN
Cj4gKw0KPiArICAg5b6Q6ZGrIHh1IHhpbiA8eHUueGluMTZAenRlLmNvbS5jbj4NCj4gKw0KPiAr
PT09PT09PT09PT09DQo+ICvlhoXmoLjlkIzpobXlkIjlubYNCj4gKz09PT09PT09PT09PQ0KPiAr
DQo+ICtLU00g5piv5LiA56eN6IqC55yB5YaF5a2Y55qE5pWw5o2u5Y676YeN5Yqf6IO977yM55Sx
Q09ORklHX0tTTT155ZCv55So77yM5bm25ZyoMi42LjMy54mI5pys5pe26KKr5re75YqgDQo+ICvl
iLBMaW51eOWGheaguOOAguivpuingSBgYG1tL2tzbS5jYGAg55qE5a6e546w77yM5Lul5Y+KaHR0
cDovL2x3bi5uZXQvQXJ0aWNsZXMvMzA2NzA05ZKMDQo+ICtodHRwczovL2x3bi5uZXQvQXJ0aWNs
ZXMvMzMwNTg5DQo+ICsNCj4gK0tTTeeahOeUqOaIt+epuumXtOeahOaOpeWPo+WcqERvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FkbWluLWd1aWRlL21tL2tzbS5yc3QNCj4gK+aWh+ah
o+S4reacieaPj+i/sOOAgg0KPiArDQo+ICvorr7orqENCj4gKz09PT0NCj4gKw0KPiAr5qaC6L+w
DQo+ICstLS0tDQo+ICsNCj4gK+amgui/sOWGheWuueivt+ingW1tL2tzbS5j5paH5qGj5Lit55qE
4oCcRE9DOiBPdmVydmlld+KAnQ0KPiArDQo+ICvpgIbmmKDlsIQNCj4gKy0tLS0tLQ0KPiArS1NN
57u05oqk552A56iz5a6a5qCR5Lit55qES1NN6aG155qE6YCG5pig5bCE5L+h5oGv44CCDQo+ICsN
Cj4gK+W9k0tTTemhtemdoueahOWFseS6q+aVsOWwj+S6jiBgYG1heF9wYWdlX3NoYXJpbmdgYCDn
moTomZrmi5/lhoXlrZjljLrln58oVk1Bcynml7bvvIzliJnku6PooajkuoYNCj4gK0tTTemhteea
hOeos+WumuagkeWFtuS4reeahOiKgueCueaMh+WQkeS6huS4gOS4qnJtYXBfaXRlbee7k+aehOS9
k+exu+Wei+eahOWIl+ihqOOAguWQjOaXtu+8jOi/meS4qktTTemhtQ0KPiAr55qEIGBgcGFnZS0+
bWFwcGluZ2BgIOaMh+WQkeS6huivpeeos+WumuagkeiKgueCueOAgg0KPiArDQo+ICvlpoLmnpzl
hbHkuqvmlbDotoXov4fkuobpmIjlgLzvvIxLU03lsIbnu5nnqLPlrprmoJHmt7vliqDnrKzkuozk
uKrnu7TluqbjgILnqLPlrprmoJHlsLHlj5jmiJDpk77mjqXkuIDkuKrmiJblpJoNCj4gK+S4queo
s+WumuagkSLlia/mnKwi55qEIumTviLjgILmr4/kuKrlia/mnKzpg73kv53nlZlLU03pobXnmoTp
gIbmmKDlsITkv6Hmga/vvIzlhbbkuK0gYGBwYWdlLT5tYXBwaW5nYGANCj4gK+aMh+WQkeivpSLl
ia/mnKwi44CCDQo+ICsNCj4gK+avj+S4qumTvuS7peWPiumTvuaOpeWIsOivpemTvuS4reeahOaJ
gOaciSLlia/mnKwi5by65Yi25LiN5Y+Y55qE5piv77yM5a6D5Lus5Luj6KGo5LqG55u45ZCM55qE
5YaZ5L+d5oqk5YaF5a2YDQo+ICvlhoXlrrnvvIzlsL3nrqHku7vkuK3kuIDkuKoi5Ymv5pysIuaY
r+eUseWQjOS4gOeJh+WGheWtmOWMuueahOS4jeWQjOeahEtTTeWkjeWItumhteaJgOaMh+WQkeea
hOOAgg0KPiArDQo+ICvov5nmoLfkuIDmnaXvvIznm7jmr5TkuI7ml6DpmZDnmoTpgIbmmKDlsITp
k77ooajvvIznqLPlrprmoJHnmoTmn6Xmib7orqHnrpflpI3mnYLmgKfkuI3lj5flvbHlk43jgILk
vYblnKjnqLPlrprmoJENCj4gK+acrOi6q+S4reS4jeiDveaciemHjeWkjeeahEtTTemhtemdouWG
heWuueS7jeeEtuaYr+W8uuWItuimgeaxguOAgg0KPiArDQo+ICvnlLEgYGBtYXhfcGFnZV9zaGFy
aW5nYGAg5by65Yi25Yaz5a6a55qE5pWw5o2u5Y676YeN6ZmQ5Yi25piv5b+F6KaB55qE77yM5Lul
5q2k5p2l6YG/5YWN6Jma5ouf5YaF5a2YDQo+ICtybWFw6ZO+6KGo5Y+Y5b6X6L+H5aSn44CCcm1h
cOeahOmBjeWOhuWFt+aciU8oTinnmoTlpI3mnYLluqbvvIzlhbbkuK1O5piv5YWx5Lqr6aG16Z2i
55qEcm1hcF/pobnvvIjljbMNCj4gK+iZmuaLn+aYoOWwhO+8ieeahOaVsOmHj++8jOiAjOi/meS4
quWFseS6q+mhtemdoueahOiKgueCueaVsOmHj+WPiOiiqyBgYG1heF9wYWdlX3NoYXJpbmdgYCDm
iYDpmZDliLbjgIINCj4gK+WboOatpO+8jOi/meacieaViOWcsOWwhue6v+aAp08oTinorqHnrpfl
pI3mnYLluqbku45ybWFw6YGN5Y6G5Lit5YiG5pWj5Yiw5LiN5ZCM55qES1NN6aG16Z2i5LiK44CC
a3NtZOi/mw0KPiAr56iL5Zyo56iz5a6a6IqC54K5IumTviLkuIrnmoTpgY3ljobkuZ/mmK9PKE4p
77yM5L2G6L+Z5LiqTuaYr+eos+WumuagkSLlia/mnKwi55qE5pWw6YeP77yM6ICM5LiN5pivcm1h
cOmhuQ0KPiAr55qE5pWw6YeP77yM5Zug5q2k5a6D5a+5a3NtZOaAp+iDveayoeacieaYvuiRl+W9
seWTjeOAguWunumZheS4iu+8jOacgOS9s+eos+WumuagkSLlia/mnKwi55qE5YCZ6YCJ6IqC54K5
5bCGDQo+ICvkv53nlZnlnKgi5Ymv5pysIuWIl+ihqOeahOW8gOWktOOAgg0KPiArDQo+ICtgYG1h
eF9wYWdlX3NoYXJpbmdgYCDnmoTlgLzorr7nva7lvpfpq5jkuobkvJrkv4Pkvb/mm7Tlv6vnmoTl
hoXlrZjlkIjlubbvvIjlm6DkuLrlsIbmnInmm7TlsJHnmoTnqLPlrpoNCj4gK+agkeWJr+acrOaO
kumYn+i/m+WFpeeos+WumuiKgueCuWNoYWluLT5obGlzdO+8ieWSjOabtOmrmOeahOaVsOaNruWO
u+mHjeezu+aVsO+8jOS9huS7o+S7t+aYr+WcqOS6pOaNouOAgeWOiw0KPiAr57yp44CBTlVNQeW5
s+ihoeWSjOmhtemdoui/geenu+i/h+eoi+S4reWPr+iDveWvvOiHtEtTTemhteeahOacgOWkp3Jt
YXDpgY3ljobpgJ/luqbovoPmhaLjgIINCj4gKw0KPiArYGBzdGFibGVfbm9kZV9kdXBzL3N0YWJs
ZV9ub2RlX2NoYWluc2BgIOeahOavlOWAvOi/mOWPlyBgYG1heF9wYWdlX3NoYXJpbmdgYCDosIPm
jqcNCj4gK+eahOW9seWTje+8jOmrmOavlOWAvOWPr+iDveaEj+WRs+edgOeos+WumuiKgueCuWR1
cOS4reWtmOWcqOeijueJh++8jOi/meWPr+S7pemAmui/h+WcqGtzbWTkuK3lvJXlhaXnoo7niYfn
rpcNCj4gK+azleadpeino+WGs++8jOivpeeul+azleWwhnJtYXDpobnku47kuIDkuKrnqLPlrpro
ioLngrlkdXDph43lrprkvY3liLDlj6bkuIDkuKrnqLPlrproioLngrlkdXDvvIzku6Xkvr/ph4rm
lL4NCj4gK+mCo+S6m+S7heWMheWQq+aegeWwkXJtYXDpobnnmoTnqLPlrproioLngrkiZHVwIu+8
jOS9hui/meWPr+iDveS8muWinuWKoGtzbWTov5vnqIvnmoRDUFXkvb/nlKjnjofvvIzlubblj68N
Cj4gK+iDveS8muWHj+aFouW6lOeUqOeoi+W6j+WcqEtTTemhtemdouS4iueahOWPquivu+iuoeeu
l+OAgg0KPiArDQo+ICtLU03kvJrlrprmnJ/miavmj4/nqLPlrproioLngrki6ZO+IuS4remTvuaO
peeahOaJgOacieeos+WumuagkSLlia/mnKwi77yM5Lul5L6/5Yig5YeP6L+H5pe25LqG55qE56iz
5a6a6IqC54K544CCDQo+ICvov5nnp43miavmj4/nmoTpopHnjofnlLEgYGBzdGFibGVfbm9kZV9j
aGFpbnNfcHJ1bmVfbWlsbGlzZWNzYGAg6L+Z5Liqc3lzZnMg5o6l5Y+j5a6a5LmJ44CCDQo+ICsN
Cj4gK+WPguiAgw0KPiArPT09PQ0KPiAr5YaF5qC45Luj56CB6K+36KeBbW0va3NtLmPjgIINCj4g
K+a2ieWPiueahOWHveaVsChtbV9zbG90ICBrc21fc2NhbiAgc3RhYmxlX25vZGUgIHJtYXBfaXRl
bSnjgIINCj4gLS0NCj4gMi4xNS4yDQo=
