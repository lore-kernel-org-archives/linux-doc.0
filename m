Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1AC221D93
	for <linux-doc@vger.kernel.org>; Wed, 21 May 2025 15:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747842075; cv=none; b=o+A0nZJbqaUDic84Tl7y8u+WZ3V6Rd0wWnFhafY+iyn5mkj8YxL1AMl36XsAhbanl0ih0mBc5Q3A31Axpm068FH972ESiRdObjtmpV9x/7mviubpAsbyPb4eZgkFM/F0WTcwxdkqprLpr5Ih5q7/m6Lt2NQhGWyP9xB02ZfffG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747842075; c=relaxed/simple;
	bh=jAtWLy1ghlyAQZQU+F7/CpguGAIrpkZQWbVBzpNAcm0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=m5lXjDe8VrsHalAiOWbJ0iJs/EYRT/jmRsMmnivCyLKyyT1E64zEnWg5MaZ+0gKpU0EIi7dqhj5g+8J5IMzKfMMgkHNwA6lPhnBeXavqdHb+nwVDzQHEHoRZW1RBj2sIOjhjIdq8+BK5tTENDTcfCqKn7kKSH3QZGKE+KVh5rvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=fail (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=cNCvBVkc reason="key not found in DNS"; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="cNCvBVkc"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3d940c7ea71so27967125ab.0
        for <linux-doc@vger.kernel.org>; Wed, 21 May 2025 08:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1747842072; x=1748446872; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvD+mNVQm/2jmSgV0usT3IDjfQuZhMOI7Av7SLu7jf0=;
        b=cNCvBVkcyeuCwvpqW3KJnW9FEKmWg85R0m3soeqRLN2KchKowqf+mxRezDqsQ3y9i0
         8zXX4pOjT2dV7j/51C2G/1CmtDYjBHLfEcahJGQxpxYS3/EUcszXSYapdKaGrqoOLp8D
         uA0YHrzR18yPXYFKjyiTlSA/5I44klQJma1k/1tZQdnDPtuR8hYscptxGsZh3IuigRBf
         hH9Mnk68wraPI0LfPb5NcBv7l6XZqE7/KCZkCZtFEPryY6G8fS2DQmmjhs3xzPk2NKJK
         PNqcVwtIOukTb2CnM0qdM0fZPYHbT/D5F1AdhbT4k47ydqkmff4EL+fTf1KTL6UCr6SW
         oexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747842072; x=1748446872;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lvD+mNVQm/2jmSgV0usT3IDjfQuZhMOI7Av7SLu7jf0=;
        b=IJziHkEnJJunzURhzqq5B/t4utcowEiAeN0HK9V+6w5cU9gF20h0JZlnIzB13Lu5Ax
         YGqiH/Nph4r0bD/DmF5t+ms1Jq/LQCGiEgthPiXLaVteGB+vnVhHDuql+wAP2eXzXsmv
         Ug2WiN6MDjcOwEo/lsQVvISqO0LD73sXRLLZzlZYiqFdmX8iFh81SzcO67qpYInxsuXw
         ZMolj7rRh9PJ0cJwMW/lDWnSzGRlHZlfdy26nYI5INa+cURnhKQ2kJcb1TeIL6n7D7+H
         xiGFJidZT1E0tZgyVEJEnnUn/cPhf+Wv0acWY6vnaWikMLmJpVClp60g5J4hrGbQ9WVt
         CAJg==
X-Forwarded-Encrypted: i=1; AJvYcCWRceAqI3x0XrrN++fhP0qpEQjPSXrJAguzfWvj32zwm3KMonF1627amAWCoxTX8qbfMsKOXhZA5yI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4DIPeC9PO7lACpJTOAv7rQLYhZARHCZHlf1pJzEoh636vfarO
	o6A0qz/bVlbFArOsIT8WgkproyNQxEWsnIg5uj+rK5h4R6Fm21HGZ24hUtMPe5ku/cM=
X-Gm-Gg: ASbGncuymvVgC8QObfey0X6o8YBTtfdNSFk4ikuE/wRKVUDZmq8V2SOXvtyxvYhljUx
	DS71tgyL0rCMljIICS+iuFfLOIhqYW2nPZEvXxU6EyHQzYe7qThJUrXTh47iD4MEhrkipBKItfj
	56d+1r6hS7eHHRXNVc0bKmin/1qqIyRb1HXDNp7T4akeM3zKjmFJi7k0defshvWSOLr1wt3jvxG
	UqxycYrj/IOhIxZnpFb5HgjW5A422UYR+5Z75RLwPf+ApqzhHKn7rRrXrr7yTsakObVkZshZ//z
	6eeVaO1mXaVoZ7djtBUp6tlxn9aeAibNKsPrFChfRvbie7R9
X-Google-Smtp-Source: AGHT+IF1a/jzMbO7F6gJPzIDd9TjYyvBG5uSioYyo5MOYniqFNvItm2zBIXk5D1DSiZdNl+D5LzuRA==
X-Received: by 2002:a05:6e02:1a2f:b0:3dc:7660:9efe with SMTP id e9e14a558f8ab-3dc7660a1b3mr97393735ab.9.1747842072167;
        Wed, 21 May 2025 08:41:12 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc4af638sm2638635173.105.2025.05.21.08.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 08:41:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 May 2025 09:41:10 -0600
Message-Id: <DA1YAY60022M.2IRYOYRE5IEVL@brighamcampbell.com>
Subject: Re: [PATCH] docs: powerpc: Add htm.rst to table of contents
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Brigham Campbell" <me@brighamcampbell.com>, <shuah@kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>, "Madhavan Srinivasan"
 <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, "Christophe Leroy"
 <christophe.leroy@csgroup.eu>, "Naveen N Rao" <naveen@kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>, "open list:LINUX FOR POWERPC (32-BIT
 AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, "open list" <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250517210757.1076554-3-me@brighamcampbell.com>
In-Reply-To: <20250517210757.1076554-3-me@brighamcampbell.com>

On Sat May 17, 2025 at 3:07 PM MDT, Brigham Campbell wrote:
> These changes fix the following error, which was introduced by commit
> ab1456c5 when Documentation/arch/powerpc/htm.rst was added to the

After submitting this patch, I've become aware that it's customary to
add a machine-parseable "Fixes" tag to help with backporting and
bisecting:

Fixes: ab1456c5aa7a63d5 ("powerpc/pseries/htmdump: Add documentation for H_=
HTM debugfs interface")

> repository without any reference to the document.
>
> Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in a=
ny toctree [toc.not_included]
>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  Documentation/arch/powerpc/index.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/arch/powerpc/index.rst b/Documentation/arch/po=
werpc/index.rst
> index 0560cbae5fa1..53fc9f89f3e4 100644
> --- a/Documentation/arch/powerpc/index.rst
> +++ b/Documentation/arch/powerpc/index.rst
> @@ -19,6 +19,7 @@ powerpc
>      elf_hwcaps
>      elfnote
>      firmware-assisted-dump
> +    htm
>      hvcs
>      imc
>      isa-versions

