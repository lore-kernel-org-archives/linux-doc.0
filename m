Return-Path: <SRS0=WXCa=4P=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A587C11D3D
	for <linux-doc@archiver.kernel.org>; Thu, 27 Feb 2020 16:52:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0EBB8246A3
	for <linux-doc@archiver.kernel.org>; Thu, 27 Feb 2020 16:52:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h2ckek+4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730550AbgB0QwS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Feb 2020 11:52:18 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35106 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730500AbgB0QwS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Feb 2020 11:52:18 -0500
Received: by mail-oi1-f195.google.com with SMTP id b18so3992648oie.2
        for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2020 08:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gp52pRjsJhSA+Hsa491NiMGo7ZzN8vh48sP/xPZjY7A=;
        b=h2ckek+46BKub8OVUhke3FC/nXyQRCv+YQ5y9CV5RbavgOyX2emB9a6/jb7odtCAKM
         5ltcv6eQIF7Ic86LAqy26c5McXL14zfj7SHokiEMytQXVSGvnJlTtIuSNHkSOQkFWjRP
         Mu7gYWpvSfwVaBUOsaWiRTp0YvOLWDionRgvz1JkZwXSBMY3V3b96qCMcMlj0mUxU56T
         mo9uGvza0log5cdDTTy2ztxkZVwF2Oog57jDbqdSKdT3X6QIagU/KCEypSCKV9XaPvzj
         wCtt3eoq7JH1jvdYAAnC4fMTn7+3EHxTnrbfi6sRJvcEaM84OCdYDwSLRgwprggtt3Y2
         wEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gp52pRjsJhSA+Hsa491NiMGo7ZzN8vh48sP/xPZjY7A=;
        b=j0zyet6GAH2q2t2Nb5IYBen+ZfiQ+2EXF+8ctR4tWJiYWtOYzQBhLOlU3lpM9iVFGF
         tpLrU45YQ7GxrWpJn/PUZdtO6EwBLdbXaECIzQTNsLIu8L3Xcljy3hlLIN3gV7zfPlkp
         OX1NRi4QT/E5rmvK/YosZzZLGQPF54saRU+QDvNmNEnBSuwc6CWC0oEevm7AmfVPbuQ1
         3ocapuqoY0hPCddEQ6wfIFzkLRdgE8Lw4+uzhpWY7k1kEp3Ot5w5S4aM8dz2adkRSfA4
         dcLr+XQB8+jKrckkSdDh7mBaUkMcnEicDK7ztAalA1KJqoCcfoE22c7SZH4pV2Z4u1PJ
         cV7w==
X-Gm-Message-State: APjAAAXD5rSb8gFmT/7hC3nbVz2ftUD6tawBRWcxHh0KAMHK18XbTaPG
        93qDoXo7lyUNj+Bg1p98bSHxxPe5FcBxsSlyWobVTA==
X-Google-Smtp-Source: APXvYqwtYAjsjMZBmazOMBlU4tgSOoeRD3FzHInhjMiQQq9Hs9Q8FYDFJIJz944uJE8l8reZMl0eKMk+IJoxnZLWgp0=
X-Received: by 2002:aca:d954:: with SMTP id q81mr4104431oig.157.1582822337290;
 Thu, 27 Feb 2020 08:52:17 -0800 (PST)
MIME-Version: 1.0
References: <20200224160215.4136-1-mic@digikod.net> <20200224160215.4136-6-mic@digikod.net>
 <CAG48ez36SMrPPgsj0omcVukRLwOzBzqWOQjuGCmmmrmsGiNukw@mail.gmail.com> <34319b76-44bd-8915-fd7c-5147f901615e@digikod.net>
In-Reply-To: <34319b76-44bd-8915-fd7c-5147f901615e@digikod.net>
From:   Jann Horn <jannh@google.com>
Date:   Thu, 27 Feb 2020 17:51:51 +0100
Message-ID: <CAG48ez1ETFhAZE1A9x=zB=b+t=pFYp3Yc0j8psFQhGwFRdDu2A@mail.gmail.com>
Subject: Re: [RFC PATCH v14 05/10] fs,landlock: Support filesystem access-control
To:     =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andy Lutomirski <luto@amacapital.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        James Morris <jmorris@namei.org>, Jann Horn <jann@thejh.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Michael Kerrisk <mtk.manpages@gmail.com>,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mickael.salaun@ssi.gouv.fr>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        Shuah Khan <shuah@kernel.org>,
        Vincent Dagonneau <vincent.dagonneau@ssi.gouv.fr>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        Linux API <linux-api@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 27, 2020 at 5:50 PM Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> =
wrote:
> On 26/02/2020 21:29, Jann Horn wrote:
> > On Mon, Feb 24, 2020 at 5:03 PM Micka=C3=ABl Sala=C3=BCn <mic@digikod.n=
et> wrote:
> >> +static inline u32 get_mem_access(unsigned long prot, bool private)
> >> +{
> >> +       u32 access =3D LANDLOCK_ACCESS_FS_MAP;
> >> +
> >> +       /* Private mapping do not write to files. */
> >> +       if (!private && (prot & PROT_WRITE))
> >> +               access |=3D LANDLOCK_ACCESS_FS_WRITE;
> >> +       if (prot & PROT_READ)
> >> +               access |=3D LANDLOCK_ACCESS_FS_READ;
> >> +       if (prot & PROT_EXEC)
> >> +               access |=3D LANDLOCK_ACCESS_FS_EXECUTE;
> >> +       return access;
> >> +}
[...]
> However, I'm not sure this hook is useful for now. Indeed, the process
> still need to have a file descriptor open with the right accesses.

Yeah, agreed.
