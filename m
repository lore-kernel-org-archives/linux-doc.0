Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702ED3E929E;
	Tue, 17 Mar 2026 15:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773762208; cv=none; b=NVWkPnEqpA4KVl0OBf8J/Y4bObtZwQhSmVcb5cVGdaR6pyGYbrbEtR3wvrzE+uyQRdGriiSIw7ruknntA/Y5vzQiw0o0EpyyKv1EDu8WgwgBPPx51FcQXYPAEd0EAF4rdm8ye9YBsYdiRRMq3mdffSZg58RCu9u5UKwGaXWsnT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773762208; c=relaxed/simple;
	bh=NhUHjMSSSOfIk89dimc4kYWGcNV1qKrVXJaFZr2Wmk0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SzKAVy8Q3LQSaT56jCx4/d5+Px5aq301+tHLWfLPntWqEkx6FbsSg8v+/p+JU0Ub62Ma6B1KQMQQj6W6ppQXtApwu6/vBMeNDYibAa70HQapi63vpJQHQ212dISdDGvaEcSk9bK05H07ZDiyPdAz+MV6fSBGZE5zUBl9DVkI2gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o//ZNOh6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o//ZNOh6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B894C4CEF7;
	Tue, 17 Mar 2026 15:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773762208;
	bh=NhUHjMSSSOfIk89dimc4kYWGcNV1qKrVXJaFZr2Wmk0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=o//ZNOh6inlgBG0ERD6jJHpvp0Fw//FrM3endmwbio1xIodEczzurkKcZZaFmuKKe
	 z02YQW0WfgqL4oWvMaixKbOlW/t1FGClO3Dixk4G/OOKR4NkUjA23i4aaQSFFJW5ad
	 qiKE09FatQjaMNYQkWNYIlkqrJrm7P1DJhAN1s8cs8D3oqhOM+5qyfuqMnFevQgqB3
	 46aKT1UOfacSwMgRp2nolkOEeHiSTJyMzgc6yTPWTA1GrLSIypcNOigvv/LRcKES3D
	 +5kJ/up56FSf9i26p+hFwqej9TJGCFHRXfAfp1nFHI8Rph5+ORNMK4KygLSlyjxhr+
	 dCthvD88/cLlw==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2WZq-0000000ELgg-05m7;
	Tue, 17 Mar 2026 16:43:26 +0100
Date: Tue, 17 Mar 2026 16:43:25 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: fix Sphinx C parser crash on __cond_acquires
 macro
Message-ID: <20260317164250.6afae483@localhost>
In-Reply-To: <20260317151156.1106-1-mahad.ibrahim.dev@gmail.com>
References: <20260317151156.1106-1-mahad.ibrahim.dev@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Mar 2026 11:11:56 -0400
Mahad Ibrahim <mahad.ibrahim.dev@gmail.com> wrote:

> When building the kernel-docs, the Sphinx C parser threw two errors:
> 
> 1. /home/code/linux/Documentation/core-api/kref:328:
>    ./include/linux/kref.h:72: WARNING: Invalid C declaration: Expected
>    end of definition. [error at 96]
>    int kref_put_mutex (
>                 struct kref *kref,
>                 void (*release) (struct kref *kref),
>                 struct mutex *mutex)
>                 __cond_acquires(true# mutex)
> 
> 2. /home/code/linux/Documentation/core-api/kref:328:
>    ./include/linux/kref.h:94: WARNING: Invalid C declaration: Expected
>    end of definition. [error at 92]
>    int kref_put_lock (
>                 struct kref *kref,
>                 void (*release)(struct kref *kref),
>                 spinlock_t *lock)
>                 __cond_acquires(true# lock)
> 
> The root cause of these errors is due to the parser's inability to
> understand sparse __cond_acquires() parameterized macro attached to the
> function. The parser expects a ';' or a '{' to verify a valid function
> signature ending.
> As of Sphinx 3.0, the parser is equipped to handle such cases via the
> c_paren_attributes list however that functionality was not adopted.
> 
> Out of all sparse/compiler-based context analysis parameterized macros
> inside the kernel, only __cond_acquires appears in the context of a
> kernel-docs comment and function, which is why it is the only macro that
> threw an error.
> 
> This bug may be attributed to the kernel's recent shift from sparse to
> compiler-based context analysis, increased strictness of Sphinx C
> parser, or some other change which transcended domains.
> 
> Add c_paren_attributes to enable Sphinx parser to handle parameterized
> function macros like __cond_acquires.

Sorry but this patch is going at the wrong direction, as this is
a kernel-doc issue. There are already a patch series under review
meant to handle this one, together with other related issues.

-- 
Thanks,
Mauro
