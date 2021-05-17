Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E998CC433ED
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 01:34:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCE57611BF
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 01:34:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233019AbhEQBft (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 16 May 2021 21:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbhEQBft (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 16 May 2021 21:35:49 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C3EC061573
        for <linux-doc@vger.kernel.org>; Sun, 16 May 2021 18:34:32 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id s19so5110532oic.7
        for <linux-doc@vger.kernel.org>; Sun, 16 May 2021 18:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/cnsTqYZc/nEK8z0eF8ZnFIEDKg8HKz/d+OjDtuYwuc=;
        b=RtRV2h/hoUcW4abEXcHZUL/jHGR6TUKFAl/ZiO2cNVxDZZsSkfAlUCHwt5gmtAH9Xi
         +RILuhSTM4V3PQIAo8NSjucn8yc3Ikd0Q6lRjL3/l0MtAodla+NICO0fAHP7q9asQVk+
         WeGSj2RSOFXjHINOSTNrStJqlwFXGOVG6U/0tj38LIEkQgoAPbBg5zD7/AMW7KwlbzFA
         ys2nYpptgC5qwezj0cJEE1R+7g2jd9NbHc6ouKQB7L1/u4pCTGFrDIc6+WQWcGSGPqKH
         R4QXHXnonx7V5G05eJe3aRe0ySgdxgpqYjqIg8VFYXC5znG9xYIzhBwCmxYwtXYuK50Y
         hmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/cnsTqYZc/nEK8z0eF8ZnFIEDKg8HKz/d+OjDtuYwuc=;
        b=sLd3kNqAyVtXcuQ4ShhxsqxY4u4nhOR88uALkb6vaNL/fMlhJ6ocBA8LoZEGrmo1SX
         0VU4grAPu9e+jGTZrLALKf0Gou/2FQmWWPZHvzBlQvLg4vOG1ZAWmADfZSHWdaLLSdkz
         l2wvX4diyJrZK+7SjHW2m1rj7dg89PnuSiEeAOVDYdfP6YpKzd5AU9eeEib5o9HbMRt8
         PkAev1JDD9Co9MEfNkUKzRD9LOJ6YJZPv3tYuRm2sGhaY4seOcQ2Qn2WdlP14uQp7Vlm
         Q70DwMXX9APvzlqapJiAS0QxIjlPlH1nPIn+NkxeJpPkqZWo1omndAYEBlK26MiP4fzJ
         UNAg==
X-Gm-Message-State: AOAM533hu54RGANHlHnqjC/sOz9oYAO8m6tWTqTzLzkNqushd2am3nmI
        TCoPHEO9mkLKvS3ektWmEEU0e94N+PB7kUxLWZsLNFoRfHBFvTEL
X-Google-Smtp-Source: ABdhPJwc1j2h0ZeZJO79VofXXU98oBmy+I5CxdQjY3iTlMZmW9N90km/49VEc631qZG9FXNontlbwCArGKxOM7FNhE0=
X-Received: by 2002:aca:5783:: with SMTP id l125mr41801376oib.130.1621215272201;
 Sun, 16 May 2021 18:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210515082406.2473543-1-siyanteng@loongson.cn> <dab014b9-ec11-dc12-30f7-1b43a852b296@gmail.com>
In-Reply-To: <dab014b9-ec11-dc12-30f7-1b43a852b296@gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Mon, 17 May 2021 09:34:21 +0800
Message-ID: <CAEensMy0OYJ99j1nfvOPAaL+oKFXkkeksnGaRpuP4eTi5kDnmw@mail.gmail.com>
Subject: Re: [PATCH v4] docs/zh_CN: add core-api workqueue.rst translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        Wu XiangCheng <bobwxc@email.cn>, huangjianghui@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

QWxleCBTaGkgPHNlYWtlZWxAZ21haWwuY29tPiDkuo4yMDIx5bm0NeaciDE25pel5ZGo5pelIOS4
iuWNiDExOjMy5YaZ6YGT77yaDQo+DQo+DQo+DQo+IE9uIDIwMjEvNS8xNSDkuIvljYg0OjI0LCBZ
YW50ZW5nIFNpIHdyb3RlOg0KPiA+ICsNCj4gPiAr5YaF5qC45YaF6IGU5paH5qGj5Y+C6ICDDQo+
ID4gKz09PT09PT09PT09PT09PT0NCj4gPiArDQo+ID4gK2NoZWNrIHRoZSBmdW5jdGlvbnMgaW4g
aW5jbHVkZS9saW51eC93b3JrcXVldWUuaCBpbiBrZXJuZWwgc291cmNlIGNvZGUuDQo+ID4gKw0K
PiA+ICtjaGVjayB0aGUgZnVuY3Rpb25zIGluIGtlcm5lbC93b3JrcXVldWUuYyBpbiBrZXJuZWwg
c291cmNlIGNvZGUuDQo+DQo+IEJldHRlciB0byBjb21iaW5lIGFib3ZlIDIgbGluZXMgYW5kIHVz
ZSBDaGluZXNlIHRvIGludHJvZHVjZSB0aGVtPw0KDQror7flnKjku6XkuIvmlofku7bkuK3mn6Xn
nIvnm7jlhbPlh73mlbDvvJoNCg0KaW5jbHVkZS9saW51eC93b3JrcXVldWUuaA0Ka2VybmVsL3dv
cmtxdWV1ZS5jDQoNClRoYW5rcywNCllhbnRlbmcNCg==
