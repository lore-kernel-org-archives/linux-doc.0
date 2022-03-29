Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFDE1C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 29 Mar 2022 14:01:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235844AbiC2ODa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Mar 2022 10:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237825AbiC2ODZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Mar 2022 10:03:25 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F19E206ED1
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 07:01:42 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id u22so15990518pfg.6
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 07:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qafIyoVjp2/zCF801IEp6SD6JfsriSZH8sbLRcResCA=;
        b=gQvCeV9fg9bIfgMNTQE6F+WDn3DIsUpRnzMIJ/djVEMWcDBu85YiakbF9q/kIvflpr
         NNhLQXCPRbncFAju6rFZT3rLqt8QvFZqqb81qFiZQdntySBeN5TJnTAi/vfUjLfY98qo
         WsMOpWymVWX21cmwpVZhW6rg8JJStVwP6uoIfDlkWh1JdIWrA+I/9j8HzHfA9Pez23mx
         VV6da90EZHhTkiJaGmo6YQxTo+eEB/gLLI6L+WAD2Pn/j3P49S0YAnWLO/LOw7+BbQBv
         EpESCXGL120Zqlhl8CS66wwvg8Zx7cLgl45E03C/l7KKE4kIrjENawTcUVY/eCSholng
         cDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qafIyoVjp2/zCF801IEp6SD6JfsriSZH8sbLRcResCA=;
        b=GlCp8wHla5NgLp84dj3Y2xW4+Yvj4d40IF9y/ZBL0vnZfRGswWOUnAOH23Yx+doEpN
         zV/kFdBJU+rYoTJe2BQqzXjolQ815ls6+hJVS99n0dVBNgWrGHmtCPWwaFbmfOwXbfbR
         ITI/Axux89v6mMpdvoeq+FmwO4zvPFlc1OH7Hjdy3u24XyhZuFbW4+K4DtGRj3XD8JbK
         dV8v+u8ydc2vqeYC7bUqAj8KmlpHhSfMUen5MHywIqlA1YYWZVnhN5FACvtfH1oi/Myy
         dSvYUY7hLxJVYEE+rrPReUcIOgVFXFAE7fNKYirH63ln/W/5/vquWkYH+WUTEUl494R5
         oIvA==
X-Gm-Message-State: AOAM531C4PEizA8zEBajit7ZOEMDcfyvLlDvRNnJkbCSATaZI7Tv0T13
        8Izj256v4WaGLs7ObYWGBH9j7XzjhE4=
X-Google-Smtp-Source: ABdhPJxK3GXjtwZEy5B8NnEVWrqTz6ygZ7aVexhAIH/BOm3/UgqBXfbRKVYRM9ZyuwWxDWHQygzL+g==
X-Received: by 2002:a63:ad45:0:b0:382:2459:5bc6 with SMTP id y5-20020a63ad45000000b0038224595bc6mr2185862pgo.474.1648562501466;
        Tue, 29 Mar 2022 07:01:41 -0700 (PDT)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id f6-20020a056a00238600b004fae79a3cbfsm20441137pfc.100.2022.03.29.07.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 07:01:41 -0700 (PDT)
Message-ID: <7de98030-c154-416c-ef80-17a2fd812dd1@gmail.com>
Date:   Tue, 29 Mar 2022 23:01:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] docs: sphinx/requirements: Limit jinja2<3.1
Content-Language: en-US
To:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org
References: <7dbff8a0-f4ff-34a0-71c7-1987baf471f9@gmail.com>
 <02a00556-d885-7532-64ad-14027a4b5e33@gmail.com>
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <02a00556-d885-7532-64ad-14027a4b5e33@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 29 Mar 2022 20:01:46 +0700,
Bagas Sanjaya wrote:
> On 29/03/22 13.07, Akira Yokosawa wrote:
>> diff --git a/Documentation/sphinx/requirements.txt b/Documentation/sph=
inx/requirements.txt
>> index 9a35f50798a6..2c573541ab71 100644
>> --- a/Documentation/sphinx/requirements.txt
>> +++ b/Documentation/sphinx/requirements.txt
>> @@ -1,2 +1,4 @@
>> +# jinja2>=3D3.1 is not compatible with Sphinx<4.0
>> +jinja2<3.1
>> =C2=A0 sphinx_rtd_theme
>> =C2=A0 Sphinx=3D=3D2.4.4
>>
>=20
> I see that we had already pinned the exact Sphinx version to 2.4.4 (or =
am
> I read the requirements wrong?), so this only matters when people use S=
phinx
> from distribution packages, rather than using virtualenv as recommended=
=2E

On the contrary!

This matters when you do fresh-install of Sphinx 2.4.4 using virtualenv.
Please try it without the limit of inja2<3.1.
If you can't reproduce the breakage, I might be missing something
something important.

I guess you had your Sphinx installed before jinja2 3.1.0
was released (March 24, 2022), didn't you?

        Thanks, Akira

