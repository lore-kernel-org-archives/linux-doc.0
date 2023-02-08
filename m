Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FD1C636CC
	for <linux-doc@archiver.kernel.org>; Wed,  8 Feb 2023 16:41:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbjBHQl2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Feb 2023 11:41:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231522AbjBHQkx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Feb 2023 11:40:53 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 420D759C5
        for <linux-doc@vger.kernel.org>; Wed,  8 Feb 2023 08:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675874396;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rkYkOL9mSyKYEtuavWiOPhy6b7dpdKwTrCd9LzJhy+8=;
        b=G6+eS4aHSST5iuGvphEAsVW8WvRYOidch+5bZumLGrFn0uupThX3LqJz9RELxb4gG73IG2
        nq9w2PSBve4/eObFucvVi3QznUkaaNdX8f+iKNntStIynhsPCq17Q/C/WSIr1dwqN5iJf8
        oveF2osvAN/+/wdaqtdPKhG2gxih+JQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-36-c__SbO3bOsCKmmiAKLNKYQ-1; Wed, 08 Feb 2023 11:39:55 -0500
X-MC-Unique: c__SbO3bOsCKmmiAKLNKYQ-1
Received: by mail-ej1-f72.google.com with SMTP id gz8-20020a170907a04800b0087bd94a505fso13577701ejc.16
        for <linux-doc@vger.kernel.org>; Wed, 08 Feb 2023 08:39:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rkYkOL9mSyKYEtuavWiOPhy6b7dpdKwTrCd9LzJhy+8=;
        b=fBF+DaSGfsfN3bVG1bq/et28icJ4rWTNwJTczu5rCkCsmRrv1ZAHrHR/csRsUs2tU8
         VhinlvmKBq+ffOSi02UfyVX3FMHw2P6cgQ8ouCPnGCJ5SPdL2zUnRBqQNdQLuGgu7rtV
         /EHgFVlm0d3ytpbS69DSpASAPbJfLNPNhZpxlA/Crc5a4Z3RHKHnTNZZ8b+1cqxOscWZ
         aLpDsqqS4Yaayf/ngUVYyYKnYy+EYo1Gt5naZojfsBpI50jrWajvYRCgQlb2Egi7hLOO
         +8yrYH7jLhMJnKLHJj6P5/8hT1E9XYz2y6hRvuNwJuiWGOnyWd0TelPj1dPYF3/AA+eu
         gJhg==
X-Gm-Message-State: AO0yUKV5i/MmYJBMhu35GrgDLgj9s9wHoUG/kiGl2yo+WhjEh6NpJJMR
        JQkRozYfYih1R4TGpvutiBFL8bLn1vu6jWDZiG/HkWTV2VXlj39KHPhc4ibdiAKoTarlwDbb8el
        wVz2fxCeqRBZ+zLNykqQS
X-Received: by 2002:a17:906:2747:b0:88d:777a:9ca6 with SMTP id a7-20020a170906274700b0088d777a9ca6mr8922956ejd.18.1675874393654;
        Wed, 08 Feb 2023 08:39:53 -0800 (PST)
X-Google-Smtp-Source: AK7set/8t5pcnjpi/TD1j5edxt/RKJH1gbwtYc60unMx5yfubJ4UtS85bbdr1pdzptlumKh3VIJ6+A==
X-Received: by 2002:a17:906:2747:b0:88d:777a:9ca6 with SMTP id a7-20020a170906274700b0088d777a9ca6mr8922919ejd.18.1675874393147;
        Wed, 08 Feb 2023 08:39:53 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id j10-20020aa7de8a000000b004a21c9facd5sm7989180edv.67.2023.02.08.08.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 08:39:52 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 300C9973CDA; Wed,  8 Feb 2023 17:39:51 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     David Vernet <void@manifault.com>
Cc:     Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>,
        Stanislav Fomichev <sdf@google.com>,
        Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, bpf@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH bpf-next v2] bpf/docs: Update design QA to be consistent
 with kfunc lifecycle docs
In-Reply-To: <Y+O8rJ3TGwl6FnVK@maniforge.lan>
References: <20230208135731.268638-1-toke@redhat.com>
 <Y+O8rJ3TGwl6FnVK@maniforge.lan>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 08 Feb 2023 17:39:51 +0100
Message-ID: <87y1p88620.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

David Vernet <void@manifault.com> writes:

> On Wed, Feb 08, 2023 at 02:57:30PM +0100, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>> Cong pointed out that there are some inconsistencies between the BPF des=
ign
>> QA and the lifecycle expectations documentation we added for kfuncs. Let=
's
>> update the QA file to be consistent with the kfunc docs, and add referen=
ces
>> where it makes sense. Also document that modules may export kfuncs now.
>>=20
>> v2:
>> - Fix repeated word (s/defined defined/defined/)
>>=20
>> Reported-by: Cong Wang <xiyou.wangcong@gmail.com>
>> Signed-off-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>
>
> Thanks for fixing this. LGTM modulo one small grammar nit.
>
> Acked-by: David Vernet <void@manifault.com>

Thanks! Will fix and respin :)

-Toke

