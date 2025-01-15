Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54DF20326
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 15:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736955605; cv=none; b=Ej5yvAjUnmq0rPqeqqXW0gly6Cb7ddDmxi/WM4RxvHE5nBlszug6HcgcBFE1xQE9iMg7lIQeo33hdziEarjM8ccXxvmJPoWnKh/kFwHFQ5y4hIsPNQzSS8H+lQXTOW4gC8M8vVLP8WgiftshnvFx7zxKDYjbzjMdjxOOWY+ZJZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736955605; c=relaxed/simple;
	bh=VK5C9Z4SSv5qoa6iG3PZcKtjJUSQhRy1hMBOhIy9H6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TCQK0xUGsuYZh+Lb84aqaoDq+62GuJgw5YsLWXaCiNOs3lO5Q89vj0gh0Iok89eVw5gGhLwlcyGE5jzFR+pPJRn8GMcevQpJA4W7YCfmkG0FSFY9erSyVOSD7/Vq0Qtsa6d8lDNL/oHQfSFmnmDZf21Vu4kbLvotq1obfCe/wew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ngNzB1XN; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ngNzB1XN"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4678c9310afso528591cf.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 07:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736955602; x=1737560402; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VK5C9Z4SSv5qoa6iG3PZcKtjJUSQhRy1hMBOhIy9H6w=;
        b=ngNzB1XN+P1sBnWMtawFBXermyJZd4EeVoL6yi4TEZ7eir8o8wolXugiV6K+OXF0mE
         kkMUtDQbJRKw1pmB8G8zwLrnUvbdrzIBNoRIQhQwXyswpLbsKAMSbdMpmcEVWuVnKFl+
         LrP/cIw1+rK0b4L6zCIeT2QL+2tJmUcRZv9VR8dWMCGbS0uRCilGkOPCD6b71MgdjL2j
         ztDldA0a0NxQXTxJNBqdrffKp+tIvNsl6HOtvSNpeWr3yqhPoJyDmHMa85XORB0bWlCK
         ArCttznhpGOospXOLeLPFBM/V1Yz2kgdSCtB69aa462g2qhdTpy+HyJGP2RQw4Kgr8S5
         J1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736955602; x=1737560402;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VK5C9Z4SSv5qoa6iG3PZcKtjJUSQhRy1hMBOhIy9H6w=;
        b=JPM6qe9Cut3y+lNEF5K460KtGc6ya0cQdkukhnlJfUgcidkp6GlFOLIKzQFw7yFQ5s
         uLMFlPJActsLG84mfZ1SxMqJECIa+EINFbze+nHhTYwz12yBhE6RPzah3C8ejPmZTpf4
         m9HRIzRsAZl+xERCra4TszYXvRpTLandwR5gxt+4Y+2hJSvvj62nS2iH1Z6QGC0EB242
         DD9yOpIzKg6ceFV9+O6DQJOjL7wHlqnYUWtpdyvsny/AZfFFZ1uTOmiPU8gCbwA+yHVv
         CVsKKETEp576LlYxXZ5SRZl+u/5EqfzVQw3kSQbi8i9lBemk9Hd6t8CvA4eFWLbrDXpm
         DmXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtLLIUZcqm4N203dt2KQQOO5wiPK+wKx/lw3V1VCRX4GNI8uFYczKG+E+BxcJMJZBvwJAs57G3b8s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX+gMRpgr30M8mSJAL06huS+KvFCGJ8oFrHP9mxlgUICVBA8wS
	he1BafMbnLFhIIL/wZvTq1DIMXKJNL7SPAnBGl++6LPp54vxqseF34KkekkIOQ0TMTXznfr5wUZ
	MqDgIY1mv6AL7ALFfMY5HMOi8SylgjFc91zHr
X-Gm-Gg: ASbGncscw5+iQVAxXkRP/+4CjhJPnLStO02hKHiOO78C8zz3fZRrz+8XE9CdH5r3mTK
	Ncx5qdgnZWScLzokGNs3aerQ85UlIVKK19tucNonjvsfHBwDzM74PsBZd737ZlWppdR0=
X-Google-Smtp-Source: AGHT+IHiPAwD2GY4KS2k3Su/muNxjeVOtTA1UJd7oUEZt5zkK5ghp6uednoGYSoIMvfkkjAAno/dN4ugjLrtGd7W79I=
X-Received: by 2002:a05:622a:38c:b0:466:923f:a749 with SMTP id
 d75a77b69052e-46df6fdae6cmr3596681cf.15.1736955602414; Wed, 15 Jan 2025
 07:40:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115-checkpatch-ignore-v2-0-8467750bf713@google.com> <20250115-checkpatch-ignore-v2-2-8467750bf713@google.com>
In-Reply-To: <20250115-checkpatch-ignore-v2-2-8467750bf713@google.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Wed, 15 Jan 2025 16:39:51 +0100
X-Gm-Features: AbW1kvbaxEIAKxA3etaigoOP7oQrhtdIf2zXGyLexzOKf4xwMzIS4SpFYF6dT58
Message-ID: <CA+i-1C38tYSjegs2jd5gXcuUk0ipEU3rPpS3KzA0eSF=RrGumQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] docs: checkpatch: Document checkpatch-ignore feature
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jan 2025 at 16:33, Brendan Jackman <jackmanb@google.com> wrote:
> +1. Configure git to include the `checkpatch-ignore` notes ref in formatted

Argh, make htmldocs just finished (it takes an extremely long time for
me...) and I realised I sent this without checking the docs output.
Turns out backticks aren't the right syntax for .rst.

Will wait for feedback on the actual thing before fixing this.
