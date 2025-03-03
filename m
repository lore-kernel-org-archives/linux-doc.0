Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E82204081
	for <linux-doc@vger.kernel.org>; Mon,  3 Mar 2025 14:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741012892; cv=none; b=sr/Psd7Hm/PFKXu0amsuukGwP1bfkDhggWjt3ZXXjXCyV+3ON1TGBx9P5VTTr11TDmCaVARdJa75tf5z3G0qKk6joYAzrkc62WPfD7oQtGfktLer62MHksAnhNmYVWRKH34WYm4DmqEYbpGYn1p75L8/Dq+23VTTWmGRi3gEbv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741012892; c=relaxed/simple;
	bh=aZmT+dUE/4t2fCfe4CEiC1nAw0DRflyAxm6MpXTO0ig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGvmpgD8P40T1WBRwN4GRjg271SecQ5ly8kAt6+s3EwkwmhmToHeacrFPEwJrGSXX4Vy//pijWQTcJrkBVzzsolICYHlu7Qr8vRokSN3OAL1OfosF3PH4NOhIuxFeUrPVzkI6k3RwbqHI4P0LMea1DYbokvS48b8tYtbPzmLGzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ha3O32tB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ha3O32tB"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4393ee912e1so80095e9.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Mar 2025 06:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741012888; x=1741617688; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=egMLwgX+4g6rb8FbE3IRa+4Vm/5YU6NsfMcpKXEu4kE=;
        b=ha3O32tByjAP6sUYTd6Da16Z2i8XKcIE/e3hLjZ0bXcRxCdpYyDYHuZw7xpXwOEKiE
         dSvUwM+kcigXUx7Qq4xhOcafu8hWJSrrXx/DUnGLy2JmCWV4fN95i0cyVERxTFFc1ENW
         pUWWUlJXRIrgeXzf7W7RFSDnDChlIUwHNNZ3cjxrymW7iN4RE+o6N9sgjyubvsAIYMP+
         qOk1cE1av7v2tqvyzOQVXerFyheLaZADA5NQpP2JvFFuGivojkqY+560PijqOh0eNjEL
         m8chdCAHn1efVXKUNUArO3vmtIX22L/b/IQORIXG/5CWTLeGKLrKGsbWO1p8D85fP2+t
         oLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741012888; x=1741617688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egMLwgX+4g6rb8FbE3IRa+4Vm/5YU6NsfMcpKXEu4kE=;
        b=JqndRj5RgfWLmSXhmgC9GBjEsWwFpRh6bAcN3WypSGdq6WQ6FNqc/zw4tXBcnLnvSc
         q0YPL59VJajfRlii0+BO1CwuCjycWv3KlVozgUo123+Zrl2zPCTtpePFaQp9iOSTwllA
         b7nv9kyZFmp2PW9VdEVKqAMlAYhj8IgGXBRYrFfK34DHxKbd+Y2WhZo/LmQ5Ac+0NMnp
         jDrX42DaECDCgUm4c4gNNI+WAuO4K/nAE2i3wC1zSTxKDdZTrXIZjCmCBl2r/UusBMOx
         jhDeIBmLocNNmYKRoQA/z2Vv/tEowyrVh828c7pHeNK+56IsQRA73VlOBwGfDe4MjDTC
         qMTA==
X-Forwarded-Encrypted: i=1; AJvYcCW4dl+ba//SBws7y5jC+X8UOwXKJTct/z24p6UXIduqyLPfaSHzoxIpF3x+1SfJyMjqxoi0HOac3c0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW9EpQ37NWYOpJA/evHtB9aZjz4CuJI5otKme9hUonB2uHvNxk
	tvvyn1NKZX6ZlcO51lXcb1qXD/aLJfRGHckb0egOSgExv+gtwQADt9u4y6P6jj80+67oi1IC4WM
	nLw==
X-Gm-Gg: ASbGncuVdx1DiJoYmUG4PacSlnV1TIohytgGYXQd70fRfGfTYbStddSDx6xn5+HC6DD
	f1cwaBZHqHoFWmTZmzc80e/jYDEhjJ6mL14FnLN66fKBgv47jzYiW0U8rS1gGuME6QtM6A7DUfe
	pg9gKVKo5bmrHO/defOOm4MLg8oCwQfi6B0eOR3icsYqWcYnKYhNpG2/UJDIqbivYPJQY5MAAVX
	HXv4v3ShIO9mPzfontsVUHJU/cNX0+AefHngaIzqo66bzE+FJI7Q7k7ZvQGBZwxRHMS+V07GupY
	bX7zkQvQXQKG1pBT1Dzhm+8zuc3MmrSBySgGbFV8lmho92OMXX+h3qS34PVfyjicFtDkTDyr+e+
	proAb
X-Google-Smtp-Source: AGHT+IHO1Nbn09jkVoFLLqMX4NW+BO4HfXiWVCPB/n7FFGm1eIqk2YrLtsq7xUv891hZ1z+4ZKSjVA==
X-Received: by 2002:a05:600c:4a19:b0:439:9434:1b6c with SMTP id 5b1f17b1804b1-43baff0940bmr2571725e9.3.1741012888246;
        Mon, 03 Mar 2025 06:41:28 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com. [34.78.232.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4844c2bsm14742014f8f.77.2025.03.03.06.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 06:41:27 -0800 (PST)
Date: Mon, 3 Mar 2025 14:41:23 +0000
From: Brendan Jackman <jackmanb@google.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] x86/cpu: Add facility to force-enable CPU caps
 and bugs
Message-ID: <Z8W_k8a04aSdO0B5@google.com>
References: <20241220-force-cpu-bug-v2-0-7dc71bce742a@google.com>
 <CA+i-1C2dB94t7nDEd-41MgLeHMYGN2oQJyQE8qnkcx+xYdHfpA@mail.gmail.com>
 <Z8GK10q_ouii0O5F@gmail.com>
 <Z8HkeZq1-Ij6MUZE@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8HkeZq1-Ij6MUZE@gmail.com>

On Fri, Feb 28, 2025 at 05:29:45PM +0100, Ingo Molnar wrote:
> * Ingo Molnar <mingo@kernel.org> wrote:
> > Integration with clearcpuid= is so much more generic than the original 
> > variant and reuses a lot of that logic, so that's a big plus.
> > 
> > I've applied it to the x86 tree under the tip:x86/cpu branch and if 
> > everything goes fine in testing it should hit v6.15 in a couple of 
> > weeks.

It seems you applied this version (v2) while there was actually a
review from Boris on this and it led to v3:

https://lore.kernel.org/linux-kernel/20250218-force-cpu-bug-v3-0-da3df43d1936@google.com/

This is weird, I can't see Boris' comments on Lore, even though they
are Cc'd to linux-kernel@vger.kernel.org. I think there was some
downtime on Lore recently, maybe they got lost?

> > One additional thing - which I'd suggest we make a 4th patch, because 
> > it affects the existing clearcpuid= behavior - is to extend 
> > set/clearcpuid= with a bit more boot time verbosity, right now it 
> > taints the kernel:
> > 
> >                                 /* empty-string, i.e., ""-defined feature flags */
> >                                 if (!x86_cap_flags[bit])
> >                                         pr_cont(" " X86_CAP_FMT_NUM, x86_cap_flag_num(bit));
> >                                 else
> >                                         pr_cont(" " X86_CAP_FMT, x86_cap_flag(bit));
> > 
> >                                 if (set)
> >                                         setup_force_cpu_cap(bit);
> >                                 else
> >                                         setup_clear_cpu_cap(bit);
> >                                 taint++;
> > 
> > 
> > I'd suggest we do what PeterZ suggested back in December: in addition 
> > to the tainting, also emit an informative pr_warn() for every CPU 
> > feature bit enabled/disabled over what was present, and maybe make a 
> > bit of a distinction between 'feature' and 'bug' feature bits.
> 
> Ie. what I mean is that at minimum upgrade the output from pr_info() to 
> pr_warn() - but maybe also make it clear in the output that the kernel 
> is tainted and things may break as a result of modifying the feature 
> bits.

Anyway, yep, I will send some upgrades to the logging, plus any diff
that got lost from v2 to v3 as a new series.

Thanks for taking a look!
