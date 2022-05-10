Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D53EC433EF
	for <linux-doc@archiver.kernel.org>; Tue, 10 May 2022 03:19:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235351AbiEJDXX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 May 2022 23:23:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235327AbiEJDWz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 May 2022 23:22:55 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE1EF16A26A
        for <linux-doc@vger.kernel.org>; Mon,  9 May 2022 20:18:59 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-2f7b815ac06so165545257b3.3
        for <linux-doc@vger.kernel.org>; Mon, 09 May 2022 20:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wIYszI5bkfdGe5tod/mlKyzpchVZPxwMfZTkJQOw06Q=;
        b=cmeWlZERK+GBHCfHIW+d1d2FfRJHXGovSQd2kA40M4bdPv2mNx1no8HcT9U8CuEr5W
         el8KFN2Xa33npEFBH4j6P0Qrek9taWci7olg598J31pa9O0U7k4SRMC2kQR967NN7nXE
         Hr3O/Y+COdig/FGBRY5Yjc2/Sq2mmRHSebaXcWhCepZjah03UzRbFxs02XvU8d0XKu0p
         McmkVu688BGBQO4fN9qdqNww5v/uqluHsckvdwJZXefv2LicaWMdlMIsffdZMk6MLWQu
         +AS6oeERc7Wv53N/VKXaBNVVkkmb3o4vdGIaE/yn2VGqvJPDrLeXSRDnZCaiOtzTfIZ9
         kpgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wIYszI5bkfdGe5tod/mlKyzpchVZPxwMfZTkJQOw06Q=;
        b=jIsMB5nh1aujjCfpi6jeM45nCDxvKqF6nCp3K0TcEY61mrDW1ATjTF1ssGUqlfYR2z
         z+9m0XR3EjYlE9IA9k1ESEZ3221niluGkncE3eSMUv+CU6eqIwhGcC9WaJZ56GJAnFf/
         VcmI7579pwV3Gprq1oHTcSTEQ79D38mwKNypnbq87r+XnHEnETBRmmpj1t5zc7CWcwk6
         jm3exjW10TFt6zVHh6ONkphNkK1jyU0W22JDAaCf/ueA3/Kq5keSZWUb7KUV3M1I1tUM
         6+IH3eWPqhJTV9tjFSmmoF4gChs3ufqCRT4VbNf9nmcZCjDp/Cx5gP/BWU+5x/IQ2KBP
         ZZKw==
X-Gm-Message-State: AOAM531eyt9PjA3MrSQLKOXC5fFc3zPYZXZiBd4oGtYGNRQmHqKLZPD1
        W0GQzlRQgL5WyMICvr66Jlhgcffq/1w7K1e8AvU1jrqLPO+oxV5T
X-Google-Smtp-Source: ABdhPJwWL9kM51mPWwIqyVlTw2gLlVPxKlvWLzr+l5kynvroX93xOQYUjpNHuxOcMJodw4FAHBXwV6QiXfW2F9A+Kjg=
X-Received: by 2002:a81:73d7:0:b0:2f7:d614:1d38 with SMTP id
 o206-20020a8173d7000000b002f7d6141d38mr17555689ywc.92.1652152738897; Mon, 09
 May 2022 20:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220510020135.55452-1-denghuilong@cdjrlc.com>
In-Reply-To: <20220510020135.55452-1-denghuilong@cdjrlc.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Tue, 10 May 2022 11:18:47 +0800
Message-ID: <CAEensMwW-7emxBidNU3mnZGCdPdWLDFUMzw4osji=XTZzOhmdQ@mail.gmail.com>
Subject: Re: [PATCH v3] docs/zh_CN: fix devicetree usage-model translation
To:     Huilong Deng <denghuilong@cdjrlc.com>
Cc:     Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

SHVpbG9uZyBEZW5nIDxkZW5naHVpbG9uZ0BjZGpybGMuY29tPiDkuo4yMDIy5bm0NeaciDEw5pel
5ZGo5LqMIDEwOjAy5YaZ6YGT77yaDQo+DQo+IG1hY2hpbmVfZGVzYyBpcyBhIGl0ZW0gaW4gZGV2
aWNldHJlZSwgc2hvdWxkbid0IGJlIGhhbGYgdHJhbnNsYXRlZC4gTGV0J3MNCj4ga2VlcCBhIHdo
b2xlIHdvcmQgdW50cmFuc2xhdGVkLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBIdWlsb25nIERlbmcg
PGRlbmdodWlsb25nQGNkanJsYy5jb20+DQo+IC0tLQ0KV2UgbmVlZCB0byB3cml0ZSBjaGFuZ2Vs
b2cgaGVyZSwgdGhlIGNvbnRlbnQgaXMgcHJvYmFibHkgdGhlIGNoYW5nZQ0KZnJvbSB2MSB0byB2
MiBhbmQgdjIgdG8gdjMuDQoNCmVn77yaDQoNCnYyIC0+IHYzDQp4eHgNCg0KdjEgLT4gdjINCnh4
eA0KDQoNCk90aGVycy4sIExHVE0uDQoNClRoYW5rcywNCllhbnRlbmcNCj4gIC4uLi90cmFuc2xh
dGlvbnMvemhfQ04vZGV2aWNldHJlZS91c2FnZS1tb2RlbC5yc3QgICAgICAgICB8IDggKysrKy0t
LS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+
DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9kZXZpY2V0
cmVlL3VzYWdlLW1vZGVsLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2Rl
dmljZXRyZWUvdXNhZ2UtbW9kZWwucnN0DQo+IGluZGV4IDMxOGEzYzZhMDExNC4uYWNjZGMzMzQ3
NWEwIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9kZXZp
Y2V0cmVlL3VzYWdlLW1vZGVsLnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9DTi9kZXZpY2V0cmVlL3VzYWdlLW1vZGVsLnJzdA0KPiBAQCAtMTIwLDI0ICsxMjAsMjQg
QEAgZHRfY29tcGF05YiX6KGo77yI5aaC5p6c5L2g5aW95aWH77yM6K+l5YiX6KGo5a6a5LmJ5Zyo
YXJjaC9hcm0vaW5jbHVkZS9hc20vbWFjaC8NCj4gIOihqOekuuS7gOS5iOOAguWcqERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5nc+S4rea3u+WKoOWFvOWuueWtl+espuS4sueahOaWh+ah
o+OAgg0KPg0KPiAg5ZCM5qC35ZyoQVJN5LiK77yM5a+55LqO5q+P5LiqbWFjaGluZV9kZXNj77yM
5YaF5qC45Lya5p+l55yL5piv5ZCm5pyJ5Lu75L2VZHRfY29tcGF05YiX6KGo5p2hDQo+IC3nm67l
h7rnjrDlnKjlhbzlrrnlsZ7mgKfkuK3jgILlpoLmnpzmnInvvIzpgqPkuYjor6XmnLrlmahfZGVz
Y+WwseaYr+mpseWKqOivpeacuuWZqOeahOWAmemAieiAheOAguWcqOaQnOe0og0KPiAr55uu5Ye6
546w5Zyo5YW85a655bGe5oCn5Lit44CC5aaC5p6c5pyJ77yM6YKj5LmI6K+lbWFjaGluZV9kZXNj
5bCx5piv6amx5Yqo6K+l5py65Zmo55qE5YCZ6YCJ6ICF44CC5Zyo5pCc57SiDQo+ICDkuobmlbTk
uKptYWNoaW5lX2Rlc2Nz6KGo5LmL5ZCO77yMc2V0dXBfbWFjaGluZV9mZHQoKeagueaNruavj+S4
qm1hY2hpbmVfZGVzYw0KPiAg5Zyo5YW85a655bGe5oCn5Lit5Yy56YWN55qE5p2h55uu77yM6L+U
5ZueIOKAnOacgOWFvOWuueKAnSDnmoRtYWNoaW5lX2Rlc2PjgILlpoLmnpzmsqHmnInmib7liLDl
jLnphY0NCj4gIOeahG1hY2hpbmVfZGVzY++8jOmCo+S5iOWug+Wwhui/lOWbnk5VTEzjgIINCj4N
Cj4gIOi/meS4quaWueahiOiDjOWQjueahOWOn+WboOaYr+inguWvn+WIsO+8jOWcqOWkp+WkmuaV
sOaDheWGteS4i++8jOWmguaenOWug+S7rOmDveS9v+eUqOebuOWQjOeahFNvQ+aIluebuOWQjA0K
PiAt57O75YiX55qEU29D77yM5LiA5Liq5py65ZmoX2Rlc2Plj6/ku6XmlK/mjIHlpKfph4/nmoTn
lLXot6/mnb/jgILnhLbogIzvvIzkuI3lj6/pgb/lhY3lnLDkvJrmnInkuIDkupvkvosNCj4gK+ez
u+WIl+eahFNvQ++8jOS4gOS4qm1hY2hpbmVfZGVzY+WPr+S7peaUr+aMgeWkp+mHj+eahOeUtei3
r+adv+OAgueEtuiAjO+8jOS4jeWPr+mBv+WFjeWcsOS8muacieS4gOS6m+S+iw0KPiAg5aSW5oOF
5Ya177yM5Y2z54m55a6a55qE5p2/5a2Q6ZyA6KaB54m55q6K55qE6K6+572u5Luj56CB77yM6L+Z
5Zyo5LiA6Iis5oOF5Ya15LiL5piv5rKh5pyJ55So55qE44CC54m55q6K5oOF5Ya1DQo+ICDlj6/k
u6XpgJrov4flnKjpgJrnlKjorr7nva7ku6PnoIHkuK3mmI7noa7mo4Dmn6XmnInpl67popjnmoTm
nb/lrZDmnaXlpITnkIbvvIzkvYblpoLmnpzotoXov4flh6DkuKrmg4XlhrXkuIvvvIwNCj4gIOi/
meagt+WBmuW+iOW/q+WwseS8muWPmOW+l+W+iOmavueci+WSjC/miJbml6Dms5Xnu7TmiqTjgIIN
Cj4NCj4gLeebuOWPje+8jOWFvOWuueWIl+ihqOWFgeiuuOmAmueUqOacuuWZqF9kZXNj6YCa6L+H
5ZyoZHRfY29tcGF05YiX6KGo5Lit5oyH5a6a4oCc5LiN5aSq5YW85a654oCd55qE5YC8DQo+ICvn
m7jlj43vvIzlhbzlrrnliJfooajlhYHorrjpgJrnlKhtYWNoaW5lX2Rlc2PpgJrov4flnKhkdF9j
b21wYXTliJfooajkuK3mjIflrprigJzkuI3lpKrlhbzlrrnigJ3nmoTlgLwNCj4gIOadpeaPkOS+
m+WvueW5v+azm+eahOmAmueUqOadv+eahOaUr+aMgeOAguWcqOS4iumdoueahOS+i+WtkOS4re+8
jOmAmueUqOadv+aUr+aMgeWPr+S7peWjsOensOS4juKAnHRpLG9tcGEz4oCdDQo+ICDmiJbigJx0
aSxvbXBhMzQ1MOKAneWFvOWuueOAguWmguaenOWcqOacgOWIneeahGJlYWdsZWJvYXJk5LiK5Y+R
546w5LqG5LiA5LiqYnVn77yM6ZyA6KaB5ZyoDQo+ICDml6nmnJ/lkK/liqjml7bkvb/nlKjnibnm
rornmoTlj5jpgJrku6PnoIHvvIzpgqPkuYjlj6/ku6Xmt7vliqDkuIDkuKrmlrDnmoRtYWNoaW5l
X2Rlc2PvvIzlrp7njrDlj5jpgJrvvIwNCj4gIOW5tuS4lOWPquWcqOKAnHRpLG9tYXAzLWJlYWds
ZWJvYXJk4oCd5LiK5Yy56YWN44CCDQo+DQo+IC1Qb3dlclBD5L2/55So5LqG5LiA5Liq56iN5b6u
5LiN5ZCM55qE5pa55qGI77yM5a6D5LuO5q+P5Liq5py65ZmoX2Rlc2PkuK3osIPnlKgucHJvYmUo
KemSqeWtkO+8jA0KPiArUG93ZXJQQ+S9v+eUqOS6huS4gOS4queojeW+ruS4jeWQjOeahOaWueah
iO+8jOWug+S7juavj+S4qm1hY2hpbmVfZGVzY+S4reiwg+eUqC5wcm9iZSgp6ZKp5a2Q77yMDQo+
ICDlubbkvb/nlKjnrKzkuIDkuKrov5Tlm55UUlVF55qE6ZKp5a2Q44CC54S26ICM77yM6L+Z56eN
5pa55rOV5rKh5pyJ6ICD6JmR5Yiw5YW85a655YiX6KGo55qE5LyY5YWI57qn77yM5a+55LqODQo+
ICDmlrDnmoTmnrbmnoTmlK/mjIHlj6/og73lupTor6Xpgb/lhY3jgIINCj4NCj4gLS0NCj4gMi4z
Ni4xDQo+DQo=
