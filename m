Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="BA//TnZG"
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F65C19D
	for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 10:16:03 -0800 (PST)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-58d06bfadf8so2761014eaf.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 10:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701108962; x=1701713762; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FxoxtfZyYEABjHZ6RtVtSj3aKhK7A/US0jtAU3g5OGk=;
        b=BA//TnZGQIcE9zbe35i7lFPkNDKCQV27j+1h/F8ePFjQyxsl4hGSl9jaymPMCYIMej
         8JzcJQsXp3XPHdb3Bgi9ZZG/RPuTr2aJ6jCvNdK/B19YU4qLeY5IhW4wSnoMt49qW9bI
         Pfl+nWyqFPQi4b8sT0rJGHoez0l4jLvX2SMunRI6AmuIRQKrexBBRkAF2cYqrtdsjoJL
         yR97/L5hr6aH7fB+NC1e2JHWyQZGU+tZ/TkbAzitdfSISHOpAqf77RQVyIYzoDisIfEb
         ST1bjWnjRbkZJrKDm/O8ccQRRu0A+bMoBtIQXmgTJVVfweRTkCUfUPOFMvB+AVyAcV1t
         JsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701108962; x=1701713762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxoxtfZyYEABjHZ6RtVtSj3aKhK7A/US0jtAU3g5OGk=;
        b=V0w7NLKkE4kw/MQPy09asS+nqo4X07Y7wLt6aWKMxyBNUjxWbrcMjHjVyr7YLEs7N8
         mImUR0V2/1KLNZRQyTGBDpQP+6DJn3cElXXbAYyhO4sHxJcu/d2x5z9ZAuRg0GIV4N7O
         2XTKxIqfBeb12xtCh1Hz6WAclfKtxkCYZJERviLYw9SjKcUtOTz3z/AjoEyAgVQswZws
         agUuYDbpEJ/6K3Ywcw8nXJrQkd+LQGg8Y3UNZTD8Wt9j+xvXxpxVTB6bh6SyqOsBgknX
         CJZaFNrzmP2fGraZADgeFZ7BruWhtiZvn00GIFihsvI7PZbWSU/Nl3fWtVsRu76s0j9S
         n3zA==
X-Gm-Message-State: AOJu0YzjPpaECmJ3a3ux2cuhMYcesye58eZTjbJJpGTz4MT+R/Ik9ke/
	aEFl0j9VG7L28TIfUzcXVQWrEw==
X-Google-Smtp-Source: AGHT+IE+v6fFB7xdHxMtYP8G0Nfw9Tf/7BYotEm3H1gVkhmuH+mh9vYsMGoDKYeeMoWzyCVVgNRotw==
X-Received: by 2002:a05:6820:809:b0:58d:a6ed:5601 with SMTP id bg9-20020a056820080900b0058da6ed5601mr1113420oob.1.1701108962609;
        Mon, 27 Nov 2023 10:16:02 -0800 (PST)
Received: from ghost ([2601:647:5700:6860:a896:28e0:13ca:92d8])
        by smtp.gmail.com with ESMTPSA id b18-20020a4ac292000000b00581daa5c5fdsm1572457ooq.29.2023.11.27.10.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 10:16:01 -0800 (PST)
Date: Mon, 27 Nov 2023 10:15:59 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: Include riscv_set_icache_flush_ctx prctl
Message-ID: <ZWTc3/FeBbXHs7aM@ghost>
References: <20231122-fencei-v1-0-bec0811cb212@rivosinc.com>
 <20231122-fencei-v1-1-bec0811cb212@rivosinc.com>
 <20231127-epilogue-frying-4d5ba926617c@wendy>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127-epilogue-frying-4d5ba926617c@wendy>

On Mon, Nov 27, 2023 at 10:44:54AM +0000, Conor Dooley wrote:
> On Wed, Nov 22, 2023 at 05:03:20PM -0800, Charlie Jenkins wrote:
> > +
> > +/**
> > + * Enable userspace to emit icache flushing instructions.
> > + *
> > + * When in per-process context, there may be multiple threads using the same mm.
> > + * Therefore, the icache can never be assumed clean when. Multiple threads in
> > + * the process may modify instructions in the mm concurrently.
> > + *
> > + * In per-thread context, it can be assumed that all modifications to
> > + * instructions in memory will be performed by this thread. When the thread is
> > + * migrated the icache will be flushed.
> > + *
> > + * @arg arg: Sets the type of context
> > + *  - PR_RISCV_CTX_SW_FENCEI: Allow fence.i in userspace. Another fence.i will
> > + *			      emitted on thread/process migration.
> > + * @arg per_thread: When set to 0, will use the default behavior of setting the
> > + *  icache flush context per process. When set to 1, will use a per thread
> > + *  context.
> > + */
> 
> FYI, this is not valid kerneldoc and breaks allmodconfig builds:
>  arch/riscv/mm/cacheflush.c:159: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> 
> > +int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long per_thread)
> 
> 
> Cheers,
> Conor.

Thank you, I will fix that in the next version.

- Charlie

