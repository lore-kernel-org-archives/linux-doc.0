Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A871C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 04:03:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 003B26103D
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 04:03:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbhIWEEo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Sep 2021 00:04:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhIWEEn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Sep 2021 00:04:43 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1B0CC061574
        for <linux-doc@vger.kernel.org>; Wed, 22 Sep 2021 21:03:12 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id b78so1050063iof.2
        for <linux-doc@vger.kernel.org>; Wed, 22 Sep 2021 21:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=B2ePPBlfkkzeoG0aRttQcTUPRUYYTheUhiudDhLin9c=;
        b=akNtlU8m7o85i6pqZfN54db3uPds/ZiJ3YR4STmtxpYGiSG3bz8uY8PTYzYWAT6i/W
         etPJGBrOCEBD2gVspAlM8fulagO3FClgGOorpslov5I609of6GqboiQYegL+q1fpUnUp
         I4qDer3JGsdSwWA4qICJxIb5z0GXqE33VvigRSWCJCsA3RGUtENC+YS8urxraMPO9mpB
         RXqru1cfhRa4W8xB2Di9wnr3s/yRZ3Doh3QHHMvz5Q0Oz12GeTV13OQFXRn6vNtnl58X
         sYx1Tk/jL4AILpPtgly5IphJZBrDmHRbgLNUvxyzKw8GvkCtSoxYNjKxDAnMzPkOkXJA
         hUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=B2ePPBlfkkzeoG0aRttQcTUPRUYYTheUhiudDhLin9c=;
        b=8EGGogoAOWwV0y4SqmnJ/QLvafg5WfYMKbnlSnWdiD6ACjRzJF8eer7hNui/3z54wW
         Ccbkq0yO+lFsUIK2bigRkaid/W+Oc1QJWCjyvPw6EsxwfgIvgAOp2MhgmnVC0UcQtIZC
         pqnMWEO8YrahgJLLxA79M+KXUIWXJGnZF+M/2iX5miKtfhdPG1jCKFSOlnMZsI4DxHIi
         E44SvCdfQf+y+oobdedVmpglIssB9SV8H3pwMuIkcbOnpf8waVMpqeWTHdUYfwwGddhI
         q21IxIP7Uc4zJ5bnSOiklOxaz3IxyYdaeDrowdYTLa3XjCXUkna+rF3QhPBCs8DO7+MD
         2+7Q==
X-Gm-Message-State: AOAM532028dOWuhqgNJEa4DF3ATSAWa7yyzXZyKz/juzWdtW1a95ClcP
        SxIc7ylqtOQo9cLy8kfd2wlZXikWofdeuv1Dgx4=
X-Google-Smtp-Source: ABdhPJzP1JnSrkRou3mmMt09oUDitHsIbzxu1dSPOlCepyXOWiAwjCajkgfDlX7hwV92QHYd3g7dQpHNEysXscrWXTo=
X-Received: by 2002:a5e:d80a:: with SMTP id l10mr2073897iok.36.1632369792026;
 Wed, 22 Sep 2021 21:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631605791.git.siyanteng@loongson.cn> <05ea58c7abf27ae451f2f3274d8dd41e1f8bc11d.1631605791.git.siyanteng@loongson.cn>
In-Reply-To: <05ea58c7abf27ae451f2f3274d8dd41e1f8bc11d.1631605791.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Thu, 23 Sep 2021 12:02:36 +0800
Message-ID: <CAJy-Amky_GfAgaXihcf2pKOxyW59V8=k92ytmAd4A5JXMs+NNA@mail.gmail.com>
Subject: Re: [PATCH 2/3] docs/zh_CN: typo fix and improve translation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVHVlLCBTZXAgMTQsIDIwMjEgYXQgNDowMCBQTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmcwMUBn
bWFpbC5jb20+IHdyb3RlOg0KPg0KPiAtIGZpeCBhIHR5cG8uDQo+IC0gbW9kaWZ5IHNvbWUgd29y
ZCB0byBpbXByb3ZlIHpoX0NOL3Byb2Nlc3MvNS5Qb3N0aW5nLnJzdC4NCj4NCj4gU2lnbmVkLW9m
Zi1ieTogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiAtLS0NCj4gIERvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Byb2Nlc3MvNS5Qb3N0aW5nLnJzdCB8IDEwICsr
KysrLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pDQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9w
cm9jZXNzLzUuUG9zdGluZy5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9w
cm9jZXNzLzUuUG9zdGluZy5yc3QNCj4gaW5kZXggYjBjNjU2MTQ4NDRkLi5jZTYyY2YwZDgxYzMg
MTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Byb2Nlc3Mv
NS5Qb3N0aW5nLnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9w
cm9jZXNzLzUuUG9zdGluZy5yc3QNCj4gQEAgLTIzLDcgKzIzLDcgQEANCj4gIDpyZWY6YERvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Byb2Nlc3Mvc3VibWl0dGluZy1kcml2ZXJzLnJz
dCA8Y25fc3VibWl0dGluZ2RyaXZlcnM+YA0KPiAg5ZKMIDpyZWY6YERvY3VtZW50YXRpb24vdHJh
bnNsYXRpb25zL3poX0NOL3Byb2Nlc3Mvc3VibWl0LWNoZWNrbGlzdC5yc3QgPGNuX3N1Ym1pdGNo
ZWNrbGlzdD5g44CCDQo+DQo+IC3kvZXml7bpgq7lr4QNCj4gK+S9leaXtuWPkemAgQ0KPiAgLS0t
LS0tLS0NCg0KSSBub3RpZWNkIG1vc3Qgb2YgbW9yZGVuIGVtYWlsIGNsaWVudCBpcyB1c2luZyAn
c2VuZCcgaW5zdGVhZCBvZg0KYW5jaWVudCAncG9zdCcsIGd1ZXNzIHRoYXQgdGhlIHJlYXNvbiBm
b3INCnlvdSB0byBmZWVsIHN0cmFuZ2Ugb24gdGhlICdwb3N0Jy/pgq7lr4TvvIw6KSBGcm9tIHRo
ZSBtZWFuaW5nIHRyYW5zbGF0aW9uLA0K6YKu5a+EIGlzIGNvcnJlY3QgQ2hpbmVzZSBmb3IgJ3Bv
c3QnLg0KQnV0IGZvciBjdXJyZW50IGN1c3RvbSwg5Y+R6YCBIGlzIGJldHRlci4gU28gbGV0J3Mg
ZG8gYSBjb21wcm9taXNlIGJldHdlZW4NCm9mIHRoZW0sIHVzZSAn5a+E6YCBJyA/DQoNClRoYW5r
cw0KQWxleA0KDQo+DQo+ICDlnKjooaXkuIHlrozlhajigJzlh4blpIflpb3igJ3kuYvliY3vvIzp
gb/lhY3lj5HluIPooaXkuIHmmK/kuIDnp43mjIHnu63nmoTor7Hmg5HjgILlr7nkuo7nroDljZXn
moTooaXkuIHvvIzov5kNCj4gQEAgLTE0Miw3ICsxNDIsNyBAQA0KPiAg5LiA6Iis5p2l6K+077yM
5L2g6LaK5oqK6Ieq5bex5pS+5Zyo5q+P5Liq6ZiF6K+75L2g5Y+Y5pu05pel5b+X55qE5Lq655qE
5L2N572u5LiK77yM5Y+Y5pu05pel5b+X77yI5ZKM5YaF5qC4DQo+ICDkvZzkuLrkuIDkuKrmlbTk
vZPvvInlsLHotorlpb3jgIINCj4NCj4gLeS4jea2iOivtO+8jOWPmOabtOaXpeW/l+aYr+WwhuWP
mOabtOaPkOS6pOWIsOeJiOacrOaOp+WItuezu+e7n+aXtuS9v+eUqOeahOaWh+acrOOAguaOpeS4
i+adpeWwhuaYr++8mg0KPiAr5LiN6ZyA6KaB6K+077yM5Y+Y5pu05pel5b+X5piv5bCG5Y+Y5pu0
5o+Q5Lqk5Yiw54mI5pys5o6n5Yi257O757uf5pe25L2/55So55qE5paH5pys44CC5o6l5LiL5p2l
5bCG5piv77yaDQo+DQo+ICAgLSDooaXkuIHmnKzouqvvvIzph4fnlKjnu5/kuIDnmoTvvIjigJwt
deKAne+8ieihpeS4geagvOW8j+OAguS9v+eUqOKAnC1w4oCd6YCJ6aG55p2lZGlmZuWwhuS9v+WH
veaVsOWQjeS4jg0KPiAgICAg5pu05pS555u45YWz6IGU77yM5LuO6ICM5L2/57uT5p6c6KGl5LiB
5pu05a655piT6KKr5YW25LuW5Lq66K+75Y+W44CCDQo+IEBAIC0xODksMTAgKzE4OSwxMCBAQA0K
PiAg5Y+R6YCB6KGl5LiBDQo+ICAtLS0tLS0tLQ0KPg0KPiAt5Zyo5a+E5Ye66KGl5LiB5LmL5YmN
77yM5oKo6L+Y6ZyA6KaB5rOo5oSP5Lul5LiL5Yeg54K577yaDQo+ICvlnKjlj5HpgIHooaXkuIHk
uYvliY3vvIzmgqjov5jpnIDopoHms6jmhI/ku6XkuIvlh6DngrnvvJoNCj4NCj4gICAtIOaCqOeh
ruWumuaCqOeahOmCruS7tuWPkemAgeeoi+W6j+S4jeS8muaNn+Wdj+ihpeS4geWQl++8n+iiq+mC
ruS7tuWuouaIt+err+abtOaUueepuueZveaIluS/rumlsOS6huihjOeahOihpeS4gQ0KPiAtICAg
5peg5rOV6KKr5Y+m5LiA56uv5o6l5Y+X77yM5bm25LiU6YCa5bi45LiN5Lya6L+b6KGM5Lu75L2V
6K+m57uG5qOA5p+l44CC5aaC5p6c5pyJ5Lu75L2V55aR6Zeu77yM5YWI5oqK6KGl5LiB5a+EDQo+
ICsgICDml6Dms5Xooqvlj6bkuIDnq6/mjqXlj5fvvIzlubbkuJTpgJrluLjkuI3kvJrov5vooYzk
u7vkvZXor6bnu4bmo4Dmn6XjgILlpoLmnpzmnInku7vkvZXnlpHpl67vvIzlhYjmiorooaXkuIHl
j5ENCj4gICAgIOe7meS9oOiHquW3se+8jOiuqeS9oOiHquW3seehruWumuWug+aYr+WujOWlveaX
oOaNn+eahOOAgg0KPg0KPiAgICAgOnJlZjpgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhf
Q04vcHJvY2Vzcy9lbWFpbC1jbGllbnRzLnJzdCA8Y25fZW1haWxfY2xpZW50cz5gDQo+IEBAIC0y
MDYsNyArMjA2LDcgQEANCj4gIOihpeS4geW6lOWni+e7iOS7pee6r+aWh+acrOW9ouW8j+WPkemA
geOAguivt+S4jeimgeWwhuWug+S7rOS9nOS4uumZhOS7tuWPkemAge+8m+i/meS9v+W+l+WuoemY
heiAheWcqOetlOWkjeS4reabtOmavg0KPiAg5byV55So6KGl5LiB55qE6YOo5YiG44CC55u45Y+N
77yM5Y+q6ZyA5bCG6KGl5LiB55u05o6l5pS+5Yiw5oKo55qE5raI5oGv5Lit44CCDQo+DQo+IC3l
r4Tlh7rooaXkuIHml7bvvIzph43opoHnmoTmmK/lsIblia/mnKzlj5HpgIHnu5nku7vkvZXlj6/o
g73mhJ/lhbTotqPnmoTkurrjgILkuI7lhbbku5bkuIDkupvpobnnm67kuI3lkIzvvIzlhoXmoLgN
Cj4gK+WPkeWHuuihpeS4geaXtu+8jOmHjeimgeeahOaYr+WwhuWJr+acrOWPkemAgee7meS7u+S9
leWPr+iDveaEn+WFtOi2o+eahOS6uuOAguS4juWFtuS7luS4gOS6m+mhueebruS4jeWQjO+8jOWG
heaguA0KPiAg6byT5Yqx5Lq65Lus55Sa6Iez6ZSZ6K+v5Zyw5Y+R6YCB6L+H5aSa55qE5Ymv5pys
77yb5LiN6KaB5YGH5a6a55u45YWz5Lq65ZGY5Lya55yL5Yiw5oKo5Zyo6YKu5Lu25YiX6KGo5Lit
55qE5Y+R5biD44CCDQo+ICDlsKTlhbbmmK/vvIzlia/mnKzlupTlj5HpgIHoh7PvvJoNCj4NCj4g
LS0NCj4gMi4yNy4wDQo+DQo=
