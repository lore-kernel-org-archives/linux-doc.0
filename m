Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D6233DEE1
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 22:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773528284; cv=none; b=JynK+iqGW9VIgIh8CaPNGVMfQpdwkxWRBDqLAP/6d/1ER3DoCF1XdtLroib8NQ/RQW4ju7+jtUUtFC4TI0dDZzGMV/j8tKY2JFvHR3X4T2674MiZJRUsEMBxoo3yP8Y+ep2nkD4PWN8LoPE2rUeEHXCMmO9lgVAk9ObA3t4EzTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773528284; c=relaxed/simple;
	bh=+BzfWIbWutBn9FVLenIu2cDO6fBukYew6iGg+YJ9bLU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b0Se4qNJsku1BqBzC7omxBxo09Hnw0pA2qj/RoVIQmzV7nqQ+bo/tjVmJEyyhmmrhy6IXBpcLMsbUd2/y1aCVHjSLRx5FpKkfkwNXi6n7NbvoQV63TYp1a5KEFg92nZhwS7kAnhAN1rBUXr4xpAXzJW6PBN/MJB65bxsZHODdHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUHvKzBF; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUHvKzBF"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-89a09ef1e3aso44892536d6.0
        for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 15:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773528282; x=1774133082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuJUhym4M/ZFIJ+HRVLrIiZVMxaVq6Aogwi4UFclA/I=;
        b=HUHvKzBF5hhX4JfsIma2dg7iVHahQVXvhnXj8AsIHtXNbMgTUuSYsPwy8VLT9xnEzF
         EeX7jt9RC7YfoK+BU25zJMWlMfztSjsh3LnnNpj0z0DyMWJqPXNAXYzgXzCr8TyUV0E8
         QwN8SbxvwIoa1lZiVk+/ugNlZzDW5T1SeilDNtenbONU4IVtyDb5jrAkYPnnyjoXawjR
         Eox8mi29T0lZpOE9gmj0Fedk5acbLbj8L20uDD9X1MIqxRUUFgjHdJj4pPZRH+cX/WKG
         FVAixQnIPaGULYn/1rQ5NgpgG4pP3cblsCvSepBTlhftfQ/CD85LZ15xbYP44UzQuVmT
         HPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773528282; x=1774133082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nuJUhym4M/ZFIJ+HRVLrIiZVMxaVq6Aogwi4UFclA/I=;
        b=lfFevIWUjH6haUclMXff0qQ5SQRnwhNyUV2iOLJuKWPgEiJzHEuIvCKriuWyLV9s8c
         8+QPyfCTpPV/EHmvubCq/Nk4dUMuribXTG0+x7Tsv99L4YfdpGIH+SvfszjGxKKJZzj7
         141VXO6TrrVmXPKxqssKd00lUY3y3/OAh49d8m7bWIAa9Mc5P9SgmjzWc8bqkeiO+/ac
         tpF8OT9cA5G1tDkYRHoWzIN1KPN/hZuJVuQiMb8+eyWb9T4lu1omigNrtHgSGAXNdtdZ
         iC8vhXW37bsD6jEUrhJaFgLSwJfA6xKS66XzVtAc9wT6IXMSfnjHENqhzxQCLPY9BLjo
         OT0w==
X-Forwarded-Encrypted: i=1; AJvYcCUOq772+g/gCL+nMBRgHQaLeWbk6uT5HEbHU4Vcq9K3P2CK4bZUgSdj15gerC7MYmZZbLjsXYrEoyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI1jCtRuH/wnrlI+ll3LLzJ4ggCJ8EMpLuUnt7FaigM3ooKl+Z
	B++XHkOIOilKdaDJ6WkGzKeYEV980fVC5bsNhEN+t30l/TI1npXCIgUH
X-Gm-Gg: ATEYQzxZQtMG3SSPvcJMfKDnF6Gqdr8KD26AevEzo1ZOSLIKpaNoyHqnyl+wc3hKliX
	+Z3Xi2ZdoIUeC0LYSsl4VAvl8CizrPKRxFh4PBg/9iswGAtW9bPGCNrFckW+XtMsym1P0HRK/rd
	a5CD6xyF/70foSgcpxnPu7m1EGaAy2vi6Ya8sUc+mklDTVHDz5J26I3T/dZhpYoxp9lMJXregNP
	gmcxR0fYm9t0ltkDNcUR2K19WbQhmW7LHV5rskoQYsTE73UxIpJFFnRUdVrGIJkXpWYxDQPGHj8
	gpro/f3p5NwdGgS3AvoCFwTyu1mlj/Xnm+iyiHFgcBihCCbrJFXZbVDEGfVxxKiXL5v2LAmR7Nn
	RBroiQa0XhiHhi5CEZv8n1YcibCaUVRj7l++Qj1eyENyyC+M9xnAgav5Cpbp4UpmwCfsMGZmZxo
	/kr57TWjfv8ehXZoroSmNLELNi2BhinPz0S7+cp7Wt7yfVIqe0DvB1Vq8yC0C8G0qs
X-Received: by 2002:a05:6214:529d:b0:89a:173d:9c54 with SMTP id 6a1803df08f44-89a81cb9be9mr117730886d6.8.1773528282565;
        Sat, 14 Mar 2026 15:44:42 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c43bb47c3sm11296526d6.14.2026.03.14.15.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 15:44:41 -0700 (PDT)
Date: Sat, 14 Mar 2026 22:44:35 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kselftest@vger.kernel.org, workflows@vger.kernel.org,
 tools@kernel.org, x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, "Paul
 E. McKenney" <paulmck@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Dmitry
 Vyukov <dvyukov@google.com>, Randy Dunlap <rdunlap@infradead.org>, Cyril
 Hrubis <chrubis@suse.cz>, Kees Cook <kees@kernel.org>, Jake Edge
 <jake@lwn.net>, Askar Safin <safinaskar@zohomail.com>, Gabriele Paoloni
 <gpaoloni@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>, Arnd Bergmann
 <arnd@arndb.de>
Subject: Re: [PATCH 0/9] Kernel API Specification Framework
Message-ID: <20260314224435.35465615@pumpkin>
In-Reply-To: <20260314111822.63a2ba4a@kernel.org>
References: <20260313150928.2637368-1-sashal@kernel.org>
	<20260314111822.63a2ba4a@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 Mar 2026 11:18:22 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Fri, 13 Mar 2026 11:09:10 -0400 Sasha Levin wrote:
> > This enables static analysis tools to verify userspace API usage at compile
> > time, test generation based on formal specifications, consistent error handling
> > validation, automated documentation generation, and formal verification of
> > kernel interfaces.  
> 
> Could you give some examples? We have machine readable descriptions for
> Netlink interfaces, we approached syzbot folks and they did not really
> seem to care for those.

The whole thing reminds me of doxygen comment blocks.
They tend to make it hard to read the source files, hard to search
the source files (due to all the extra matches) and are pretty much
always out of date.

The kerndoc comment blocks for trivial helper functions are hard enough
to keep up to date.

The only way even parameter descriptions are going to stay correct is if the
compiler is using the definition and only the comment part is extra.
For error returns you'll need the documentation to be at the return site.

	David
