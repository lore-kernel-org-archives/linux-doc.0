Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 499D2C432BE
	for <linux-doc@archiver.kernel.org>; Tue, 24 Aug 2021 09:15:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25B0061262
	for <linux-doc@archiver.kernel.org>; Tue, 24 Aug 2021 09:15:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235652AbhHXJQe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 Aug 2021 05:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235418AbhHXJQd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Aug 2021 05:16:33 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E64EBC0613C1
        for <linux-doc@vger.kernel.org>; Tue, 24 Aug 2021 02:15:49 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id y3so19870751ilm.6
        for <linux-doc@vger.kernel.org>; Tue, 24 Aug 2021 02:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ocP+wkdb2BNvcPZ5ojTdh8Wd0luGtRfTF4RcLy0/CHM=;
        b=urf1UzbAP4Ket5Q1hnvY9N3MR/oVzYhS6Wzr+N+NomN2bbtdEBGwqtE3yZaVq6zubO
         J5wH0CKttxpzNZg30nmklW+RQ56GRCmfiV+9sABS6c6wDwDtoQ27WtO6JfwlZwv4PIRD
         RC5cNw7z8qN0p3u1ZcWOTRrIsXlgL2W2+kv4Z9ZH+Wmo9s6YM1sIbSfrYTH23A7v0nVx
         ojtZqQexwoTAC4Vap/RxKtVB72KZ4jCQiNLznSACoUT0UOmxYj+QnJPKIovIk/MvGAjN
         cohFJQ/i36ddbeZU4wupFw7r/PnBQR+9B4hR7SRhverO+6/eW9jyAOEraL/LdB3xvhdR
         QPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ocP+wkdb2BNvcPZ5ojTdh8Wd0luGtRfTF4RcLy0/CHM=;
        b=YtfM6QlWRymMj/C9+vH7lTSCg3PCg+n0YLGHaqmZVkA6uOUgNgkWvJfNcv4dlgZent
         IP8PmTrpHOH4gnspZibTmpuDWt4wEgf9yunJ+Qq4/AGJwrBud+M8RbIzcW+UksfEfFeP
         vK+DXrimtXbW6L7KUEB2HqLEirs35e6uqvqkz+FuUqf9Waaupx9edIsKH5mUqWIFpfec
         gQWpm1E8fN7nKbB6fMiWIlFbq8+nk3MZ+tUgakFVbd4sO6YVWnjOoiejSL6GoGf82jfM
         hjPSGQrMY9HUrJIOy07BfwVVoaiMu0pk1StKToFdN3mb04qI1QLtfrYf/ZMP4pywzmKO
         xcmw==
X-Gm-Message-State: AOAM530kUoQwaYnCya7GUj+gbHhYhboKK8HxXkTvmuX4MK1MBAdw6McL
        E68nxwNSndLpyJO/uD6BGOVMyq/6a5hJAB2tsek=
X-Google-Smtp-Source: ABdhPJzMV4QN6gLYxH0Bs1V73SGARoPLLwwHSmvrcWxnTAZn7gTEXqPPJg9qPUV7AKXlmpzEMVEoEt/brrsQQKx8PMk=
X-Received: by 2002:a05:6e02:78d:: with SMTP id q13mr26369584ils.262.1629796549289;
 Tue, 24 Aug 2021 02:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1629274856.git.siyanteng@loongson.cn> <ead97c192e0f947e214fd857905bab5eeaeda14f.1629274856.git.siyanteng@loongson.cn>
In-Reply-To: <ead97c192e0f947e214fd857905bab5eeaeda14f.1629274856.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Tue, 24 Aug 2021 17:15:12 +0800
Message-ID: <CAJy-Amkm-_UrxXkTMn0=EJb+no3Y_rf8TQUAu-AjGJH0jniQkQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] docs/zh_CN: add core-api gfp_mask-from-fs-io translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        chenfeiyang@loongson.cn, chris.chenfeiyang@gmail.com,
        yanteng si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gV2VkLCBBdWcgMTgsIDIwMjEgYXQgNDozMiBQTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9v
bmdzb24uY24+IHdyb3RlOg0KPg0KPiBUcmFuc2xhdGUgRG9jdW1lbnRhdGlvbi9jb3JlLWFwaS9n
ZnBfbWFzay1mcm9tLWZzLWlvLnJzdCBpbnRvIENoaW5lc2UuDQo+DQo+IFNpZ25lZC1vZmYtYnk6
IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gLS0tDQo+ICAuLi4vemhfQ04v
Y29yZS1hcGkvZ2ZwX21hc2stZnJvbS1mcy1pby5yc3QgICAgfCA2NiArKysrKysrKysrKysrKysr
KysrDQo+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL2NvcmUtYXBpL2luZGV4LnJzdCAgICAgfCAg
MiArLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04v
Y29yZS1hcGkvZ2ZwX21hc2stZnJvbS1mcy1pby5yc3QNCj4NCj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2NvcmUtYXBpL2dmcF9tYXNrLWZyb20tZnMtaW8u
cnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkvZ2ZwX21hc2st
ZnJvbS1mcy1pby5yc3QNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAw
MDAwLi5hMmI4MTMxM2Y3YTcNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9Eb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9nZnBfbWFzay1mcm9tLWZzLWlvLnJzdA0KPiBA
QCAtMCwwICsxLDY2IEBADQo+ICsuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QN
Cj4gKw0KPiArOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL2NvcmUtYXBpL2dmcF9tYXNrLWZyb20t
ZnMtaW8ucnN0DQo+ICsNCj4gKzrnv7vor5E6DQo+ICsNCj4gKyDlj7jlu7bohb4gWWFudGVuZyBT
aSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiArDQo+ICs65qCh6K+ROg0KPiArDQo+ICsNCj4g
Kw0KPiArLi4gX2NuX2NvcmUtYXBpX2dmcF9tYXNrLWZyb20tZnMtaW86DQo+ICsNCj4gKz09PT09
PT09PT09PT09PT09PT09PT09PT09PT0NCj4gK+S7jkZTL0lP5LiK5LiL5paH5Lit5L2/55So55qE
R0ZQ5o6p56CBDQo+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ICsNCj4gKzrml6Xm
nJ86IDIwMTjlubQ15pyIDQo+ICs65L2c6ICFOiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BrZXJuZWwu
b3JnPg0KPiArDQo+ICvnroDku4sNCj4gKz09PT0NCj4gKw0KPiAr5paH5Lu257O757uf5ZKMSU/m
oIjkuK3nmoTku6PnoIHot6/lvoTlnKjliIbphY3lhoXlrZjml7blv4XpobvlsI/lv4PvvIzku6Xp
mLLmraLlm6Dnm7TmjqXosIPnlKhGU+aIlklP6Lev5b6E55qE5YaFDQo+ICvlrZjlm57mlLblkozp
mLvloZ7lt7Lnu4/mjIHmnInnmoTotYTmupDvvIjkvovlpoLplIEtLeacgOW4uOingeeahOaYr+eU
qOS6juS6i+WKoeS4iuS4i+aWh+eahOmUge+8ieiAjOmAoOaIkOmAkuW9kuatuw0KPiAr6ZSB44CC
DQoNCuKAnWFuZCBibG9ja2luZ+KAnCAgaGVyZSwgYXMgbXkgdW5kZXJzdGFuZGluZywgaXMgdG8g
ZW1waGFzaXplIHRoZSAnYW5kJywNCnNvIG1heWJlIHRoZSAnYW5kJyBjb3VsZCBiZQ0KdHJhbnNs
YXRlZCBhcyDigJjlubbkuJTigJnvvJ8NCg0KQXMgdG8gb3RoZXJzLA0KUmV2aWV3ZWQtYnk6IEFs
ZXggU2hpIDxhbGV4c0BrZXJuZWwub3JnPg0KDQpUaGFua3MNCg0KPiArDQo+ICvpgb/lhY3ov5nn
p43mrbvplIHpl67popjnmoTkvKDnu5/mlrnms5XmmK/lnKjosIPnlKjliIbphY3lmajml7bvvIzl
nKhnZnDmjqnnoIHkuK3muIXpmaRfX0dGUF9GU+WSjF9fR0ZQX0lPDQo+ICvvvIjms6jmhI/lkI7o
gIXmhI/lkbPnnYDkuZ/opoHmuIXpmaTnrKzkuIDkuKrvvInjgIJHRlBfTk9GU+WSjEdGUF9OT0lP
5Y+v5Lul5L2c5Li65b+r5o235pa55byP5L2/55So44CC5L2G5LqLDQo+ICvlrp7or4HmmI7vvIzk
uIrov7Dmlrnms5Xlr7zoh7Tkuobmu6XnlKjvvIzlvZPpmZDliLbmgKfnmoRnZnDmjqnnoIHooqvn
lKjkuo7igJzkuIfkuIDigJ3ml7bvvIzmsqHmnInmm7Tmt7HlhaXnmoTogIPomZHvvIwNCj4gK+i/
meWvvOiHtOS6humXrumimO+8jOWboOS4uui/h+W6puS9v+eUqEdGUF9OT0ZTL0dGUF9OT0lP5Lya
5a+86Ie05YaF5a2Y6L+H5bqm5Zue5pS25oiW5YW25LuW5YaF5a2Y5Zue5pS255qE6ZeuDQo+ICvp
opjjgIINCj4gKw0KPiAr5pawQVBJDQo+ICs9PT09PQ0KPiArDQo+ICvku440LjEy5byA5aeL77yM
5oiR5Lus5Li6Tk9GU+WSjE5PSU/kuIrkuIvmlofmj5DkvpvkuobkuIDkuKrpgJrnlKjnmoTkvZzn
lKjln59BUEnvvIzliIbliKvmmK8NCj4gK2BgbWVtYWxsb2Nfbm9mc19zYXZlYGAgLCBgYG1lbWFs
bG9jX25vZnNfcmVzdG9yZWBgIOWSjCBgYG1lbWFsbG9jX25vaW9fc2F2ZWBgICwNCj4gK2BgbWVt
YWxsb2Nfbm9pb19yZXN0b3JlYGAg77yM5YWB6K645LuO5paH5Lu257O757uf5oiWSS9P55qE6KeS
5bqm5bCG5LiA5Liq5L2c55So5Z+f5qCH6K6w5Li65LiA5LiqDQo+ICvlhbPplK7pg6jliIbjgILk
u47or6XkvZznlKjln5/nmoTku7vkvZXliIbphY3pg73lsIbku47nu5nlrprnmoTmjqnnoIHkuK3l
iKDpmaRfX0dGUF9GU+WSjF9fR0ZQX0lP77yM5omA5LulDQo+ICvmsqHmnInlhoXlrZjliIbphY3l
j6/ku6Xov73muq/liLBGUy9JT+S4reOAgg0KPiArDQo+ICsNCj4gK+ivpUFQSeWcqOS7peS4i+WG
heaguOS7o+eggeS4rToNCj4gKw0KPiAraW5jbHVkZS9saW51eC9zY2hlZC9tbS5oDQo+ICsNCj4g
K+eEtuWQju+8jEZTL0lP5Luj56CB5Zyo5Lu75L2V5LiO5Zue5pS25pyJ5YWz55qE5YWz6ZSu6YOo
5YiG5byA5aeL5LmL5YmN566A5Y2V5Zyw6LCD55So6YCC5b2T55qE5L+d5a2Y5Ye95pWwDQo+ICvi
gJTigJTkvovlpoLvvIzkuI7lm57mlLbkuIrkuIvmloflhbHkuqvnmoTplIHmiJblvZPkuovliqHk
uIrkuIvmlofltYzlpZflj6/og73pgJrov4flm57mlLbov5vooYzml7bjgILmgaLlpI3lh73mlbAN
Cj4gK+W6lOivpeWcqOWFs+mUrumDqOWIhue7k+adn+aXtuiiq+iwg+eUqOOAguaJgOaciei/meS4
gOWIh+acgOWlvemDveS8tOmaj+edgOino+mHiuS7gOS5iOaYr+WbnuaUtuS4iuS4i+aWh++8jOS7
pQ0KPiAr5pa55L6/57u05oqk44CCDQo+ICsNCj4gK+ivt+azqOaEj++8jOS/neWtmC/mgaLlpI3l
h73mlbDnmoTmraPnoa7phY3lr7nlhYHorrjltYzlpZfvvIzmiYDku6Xku47njrDmnInnmoROT0lP
5oiWTk9GU+iMg+WbtOWIhuWIq+iwgw0KPiAr55SoIGBgbWVtYWxsb2Nfbm9pb19zYXZlYGAg5oiW
IGBgbWVtYWxsb2Nfbm9pb19yZXN0b3JlYGAg5piv5a6J5YWo55qE44CCDQo+ICsNCj4gK+mCo+S5
iF9fdm1hbGxvYyhHRlBfTk9GUynlkaLvvJ8NCj4gKz09PT09PT09PT09PT09PT09PT09PT09PT09
PQ0KPiArDQo+ICt2bWFsbG9j5LiN5pSv5oyBR0ZQX05PRlPor63kuYnvvIzlm6DkuLrlnKjliIbp
hY3lmajnmoTmt7HlpITmnInnoaznvJbnoIHnmoRHRlBfS0VSTkVM5YiG6YWN77yM6KaB5L+uDQo+
ICvlpI3ov5nkupvliIbphY3mmK/nm7jlvZPkuI3lrrnmmJPnmoTjgILov5nmhI/lkbPnnYDnlKhH
RlBfTk9GUy9HRlBfTk9JT+iwg+eUqCBgYHZtYWxsb2NgYCDlh6DkuY4NCj4gK+aAu+aYr+S4gOS4
qumUmeivr+OAguWlvea2iOaBr+aYr++8jE5PRlMvTk9JT+ivreS5ieWPr+S7pemAmui/h+iMg+Wb
tEFQSeWunueOsOOAgg0KPiArDQo+ICvlnKjnkIbmg7PnmoTkuJbnlYzkuK3vvIzkuIrlsYLlupTo
r6Xlt7Lnu4/moIforrDkuobljbHpmannmoTkuIrkuIvmlofvvIzlm6DmraTkuI3pnIDopoHnibnl
iKvnmoTnhafpob7vvIwgYGB2bWFsbG9jYGANCj4gK+eahOiwg+eUqOW6lOivpeayoeacieS7u+S9
lemXrumimOOAguacieaXtu+8jOWmguaenOS4iuS4i+aWh+S4jeaYr+W+iOa4healmu+8jOaIluiA
heacieWPoOWKoOeahOi/neinhOihjOS4uu+8jOmCo+S5iA0KPiAr5o6o6I2Q55qE5pa55rOV5piv
55So6IyD5Zu0QVBJ5YyF6KOFdm1hbGxvY++8jOW5tuWKoOS4iuazqOmHiuadpeino+mHiumXrumi
mOOAgg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29y
ZS1hcGkvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1h
cGkvaW5kZXgucnN0DQo+IGluZGV4IDFkNmZlY2Q2OWMzYi4uMjIzMWZkMzE1ZTNjIDEwMDY0NA0K
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9pbmRleC5y
c3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkvaW5k
ZXgucnN0DQo+IEBAIC0xMDQsNiArMTA0LDcgQEAgVG9kb2xpc3Q6DQo+ICAgICBtbS1hcGkNCj4g
ICAgIGdlbmFsbG9jDQo+ICAgICBib290LXRpbWUtbW0NCj4gKyAgIGdmcF9tYXNrLWZyb20tZnMt
aW8NCj4NCj4gIFRvZG9saXN0Og0KPg0KPiBAQCAtMTEyLDcgKzExMyw2IEBAIFRvZG9saXN0Og0K
PiAgICAgZG1hLWF0dHJpYnV0ZXMNCj4gICAgIGRtYS1pc2EtbHBjDQo+ICAgICBwaW5fdXNlcl9w
YWdlcw0KPiAtICAgZ2ZwX21hc2stZnJvbS1mcy1pbw0KPg0KPiAg5YaF5qC46LCD6K+V55qE5o6l
5Y+jDQo+ICA9PT09PT09PT09PT09PQ0KPiAtLQ0KPiAyLjI3LjANCj4NCg==
