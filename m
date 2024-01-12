Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9761B27B
	for <linux-doc@vger.kernel.org>; Fri, 12 Jan 2024 03:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NFFdl0X1"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50eac018059so7497708e87.0
        for <linux-doc@vger.kernel.org>; Thu, 11 Jan 2024 19:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1705031606; x=1705636406; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c8TuUZrhjbDv+Rm2dZnvkGXea+jXRSU7uK9nGbNFVT0=;
        b=NFFdl0X1G3p8DhKmNxujey2OC5aml2O64i3JvPfuI9optu+vDKOTr5MhREt2hKUtDL
         Jzr6CoFNHGlgwVEmXIvQob+omIyNVkVNpgcK6YyYZ46dmC++oIEp1OyVGnA3OGta6qYZ
         bHY5nkx4Nngnz34KerCEZqlknyJ9hQYYRCyxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705031606; x=1705636406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8TuUZrhjbDv+Rm2dZnvkGXea+jXRSU7uK9nGbNFVT0=;
        b=kdYpxriqryZNMgPTRERv6Wms6mAwp6aTJr9EBd8IdGRQdN48W9GqAfTLICyxpNFUPC
         WVdEswCAbTjsK1CcVIOfEhGJ2d5QUbLXq7hxTvv0UHO1j7K/ufZm9bR6apBJbcupa2In
         agFmBn3mfrDr4O1KAgRRoawKCZrNwj9vTEFooPTRfEST3JGjHuDhrfSYnS801I97VQKs
         JVpJ33JTixj0FXZQPcVLP7nBLByjxic2RWgo+dxI3CtA0zPa7gA/F2CPo0yCKJ8jsdyt
         SlZAlVWbvuRnuDaX7vBcj8Hdj8jLQ0epHjKI03h7jbrzSHX+4wjDzX13zL83kWw+3C5z
         UXsg==
X-Gm-Message-State: AOJu0YxTd6STVxmMr/UyfxD76Eldt43fncD1enov9OoMw2r3jctWU5b3
	UofpcN91DjdojQHOg02yZkzRGUBUZpignb/+8KLRphKFK8mkWwec
X-Google-Smtp-Source: AGHT+IEOn0D1JeJ2Ztuo54m/qrJLlM0GFzDcLYrrPHej0znN1I3Jy3GR93baITccEfu3Oq5e6wfgNA==
X-Received: by 2002:a05:6512:234a:b0:50e:76eb:ba14 with SMTP id p10-20020a056512234a00b0050e76ebba14mr462416lfu.32.1705031606230;
        Thu, 11 Jan 2024 19:53:26 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id o17-20020ac24e91000000b0050e77abd553sm368150lfr.76.2024.01.11.19.53.25
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 19:53:25 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cd703e9014so42441091fa.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Jan 2024 19:53:25 -0800 (PST)
X-Received: by 2002:a05:6512:2386:b0:50e:8ccc:6df5 with SMTP id
 c6-20020a056512238600b0050e8ccc6df5mr477364lfv.27.1705031605206; Thu, 11 Jan
 2024 19:53:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87sf37vegj.fsf@meer.lwn.net>
In-Reply-To: <87sf37vegj.fsf@meer.lwn.net>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Thu, 11 Jan 2024 19:53:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=whtqOvx4_GL8MX+bGroS5hfueP+Arch_qVYwQDJVvFCKg@mail.gmail.com>
Message-ID: <CAHk-=whtqOvx4_GL8MX+bGroS5hfueP+Arch_qVYwQDJVvFCKg@mail.gmail.com>
Subject: Re: [GIT PULL] Documentation for 6.8
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Jan 2024 at 10:59, Jonathan Corbet <corbet@lwn.net> wrote:
>
> - The minimum Sphinx requirement has been raised to 2.4.4, following a
>   warning that was added in 6.2.

Well, speaking of warnings, github now has this "dependabot" thing
that warns about bad minimum requirements due to tooling that has
security issues.

And it warns about our "jinja2 < 3.1" requirement, because apparently
that can cause issues:

  "The xmlattr filter in affected versions of Jinja accepts keys
containing spaces. XML/HTML attributes cannot contain spaces, as each
would then be interpreted as a separate attribute. If an application
accepts keys (as opposed to only values) as user input, and renders
these in pages that other users see as well, an attacker could use
this to inject other attributes and perform XSS. Note that accepting
keys as user input is not common or a particularly intended use case
of the xmlattr filter, and an application doing so should already be
verifying what keys are provided regardless of this fix"

with affected versions being marked as < 3.1.3 and fixed in Jinja2 3.1.3

I'm ignoring this github dependabit warning since the issue seems to
be rather irrelevant for our doc use, but I thought I'd mention it.

            Linus
