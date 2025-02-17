Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F156226521
	for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 16:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739811406; cv=none; b=XjwNPNKHOXIHbMt0UN1jCd97rczXkm0XxNxV0g/5xqBTv4QVwWhV8562//110sZbZZalv6yBu6e3Y6TtP3+GKPNgBydGhbEtB/Snp9ALwZGVFBs4PnTZrdOuNczmWg7GLZ4adnTSApX9Y7+OirawJSc/R+QE5vVYcXD96jV359g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739811406; c=relaxed/simple;
	bh=+1QvmTeltNCy0ewISfLGnEHCX0liAeBHZC9vjnmbvGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JlpVkBqPYEIcvwP9BqE7oe4TwOt7Md9toOt3qabP26Dro65RqHDgyHwJjkJHuByYlF9Fep8FnnosHLgeBW595QMULZmwCfgXPrqbuTCOdrY18YCXD9T153OkOQzIyXscoauyCEZie3jKXoOZf9aZWf1gwqaD8lXIvj5LfrmUUBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RFhTmS3X; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RFhTmS3X"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-471f1dd5b80so224461cf.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 08:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739811404; x=1740416204; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/qSRpBN359hHX+cCE/TztrmjJSk1+HscqPfr/QXbduM=;
        b=RFhTmS3XyGNNFtKnyy7CBpgAD4vGAWzQbfz3Lv7wF+ULUyiSAi7GMglIlUhD61JK0T
         9r0/2hoR4i6gnqPZHLT9rhVJ2kuKcE49Ho5innQO42sOf3xoxDlc3u98aqWYh1bubqCf
         h48CSx2YY5hDfRcl+umICAH+aGLQAGrPObiZnahHGDquBdeR/9O6lvJzJxGYQP/kDXIn
         1jUP0DjYX2RZYpfnkKhjza4JIXePNBEGWLze2MC0x5/HjRtAgIKYkM6qVyD5Z71YfquM
         dYFkkqVRLVT05jwjVVax28cZrVzbI/Elh8SwYT8ykxwkVSNAsotZ1+wxe8NDh+lvUVJU
         ZlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739811404; x=1740416204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qSRpBN359hHX+cCE/TztrmjJSk1+HscqPfr/QXbduM=;
        b=xHkZSB20phXsHEQ48TV/s4uHMdAe3wqSI8D24hWnQxhe+Q4S6USp+DmF/ySZXPw9yV
         Plxbwv7bFsTDpdh7CdBw8OXyRHy+HU5525j3FUS5/CaTC0yb+rx5Q8BxrsEO+6uiufCy
         BP9pDi8/bhpGz5Na+6uk39YowMAqr+Ktx6LvP0SLZhdUnJ56HUMADrZN+wXGqBQfQX7r
         vvWWgOLxgwZnMKtCYggNAH16GUOrz+v11ZEySmqE79c6VHW2SE130nULip9krrpnRIYT
         SLVv10HzrejnBjXufsY9POnuxQl4XKMpq3ZA30Etwx6IClruyxLPmkrmfZxAEigciqzt
         WtVw==
X-Forwarded-Encrypted: i=1; AJvYcCXbwlTMFd704syhA7a/ihzU/A7LCwVC3PtOtdiCSNbr9a+D3qkeqXPydpfiMjKXWh3jY6MmJ92VEeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV7u41Y545OvRhGc+jP5AdjSK8g2IOWsoI/0a/+h2b6TSRBzvu
	fPOaqzpYPCKH9H9JNrrf47ZUK27IBWqZfWgab4xRpjYLfSw2WmHaG4+4l+IBibbYXYpnQNCZfsb
	pgH9n/7WVTxtTQs4kfTxm6//ZqtnWpWsV9RZ1
X-Gm-Gg: ASbGncuc1t/5FOJVo2MbzgzCUO2KL661kMDFukewkOlwaOV9VrBcM9wUnlSxcNOXIoc
	JGa6swIxv0ldaG6uLhJHST0Xe6r7FMy1cXG3HhtNWv3vtECc1/ETUjbfyIHJO1RldMmFc+dHnJE
	cdSRN/iKqPaaUXmWcdoZUsRM3TZRI=
X-Google-Smtp-Source: AGHT+IHCtMfDw98unx789UAqr8x+szvL570MR31u78p51rZTiegX2ScDlDe+ywsfBL4Sg33XW0YMbvVNgXrwIIoDMqc=
X-Received: by 2002:a05:622a:54e:b0:471:badd:bd2f with SMTP id
 d75a77b69052e-471dc6602d2mr7637521cf.0.1739811403868; Mon, 17 Feb 2025
 08:56:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129-force-cpu-bug-v2-0-5637b337b443@google.com>
 <20250129-force-cpu-bug-v2-3-5637b337b443@google.com> <20250217111029.GIZ7MZJUGJRoeiScgn@fat_crate.local>
In-Reply-To: <20250217111029.GIZ7MZJUGJRoeiScgn@fat_crate.local>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 17 Feb 2025 17:56:32 +0100
X-Gm-Features: AWEUYZl87gmBfs2wNkKiO_BAOR84Ep0eGh95DvqtW1gZo2AtnCOxVeh-iiek0-Y
Message-ID: <CA+i-1C3fetiBYVbfpAbQEAnogzdza25pu2DosCiTT9YkXwt0yw@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 3/3] x86/cpu: Enable modifying bug flags with {clear,set}puid
To: Borislav Petkov <bp@alien8.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Feb 2025 at 12:10, Borislav Petkov <bp@alien8.de> wrote:
> > @@ -1492,7 +1492,8 @@ static inline void parse_set_clear_cpuid(char *arg, bool set)
> >
> >               /*
> >                * Handle naked numbers first for feature flags which don't
> > -              * have names.
> > +              * have names. It doesn't make sense for a bug not to have a
> > +              * name so don't handle bug flags here.
> >                */
> >               if (!kstrtouint(opt, 10, &bit)) {
> >                       if (bit < NCAPINTS * 32) {
>
> It did but after
>
>   7583e8fbdc49 ("x86/cpu: Remove X86_FEATURE_NAMES")
>
> this chunk can be whacked now. Please do that in a pre-patch.

Er, hold on, what chunk can be whacked? Do you mean delete the ability
to set clearcpuid by number? There are still features with no name.
