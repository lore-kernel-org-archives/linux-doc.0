Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09D23A452D
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 13:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778504876; cv=none; b=CGoutpKymGGbzHkgKXEeYaeDNRr2b0dJouqFjWJpxcHCoLzT3ehlLyDI+cIIO40tTKlr9sMb9RJBzXM82djBG8nkLkxKAR077LXJNDuIUYHVOV18j1WqpQ0ljaoh437mtxMEcl72Wanek5h08XJAdCVawQec7SbsopkoWCoLTo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778504876; c=relaxed/simple;
	bh=Ve14qOZB6IijyDTsiUWPeGOsSOLkx/bw4m6bBMVawZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hn2PWCLUUQKixiOcGdNo+f48yF9ObcfME49HNMM//XTTUwOhnig0GqbfLSQgJLEnwc2woTekPVrtrj5ANDWkiXg3shoOUf6AFOScNCCgYobfJQJjMWFyAicX7EZB5+Q++Z4rQeBQp2sAPVn+g6cNWvm2QA38nWARhTRd7vKp9+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Sgx4Hd7t; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Sgx4Hd7t"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso50927705e9.1
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 06:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778504873; x=1779109673; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dy6auEdvCgEB/rpn78rKFNSXFt4boyLgJAQZRyoszRY=;
        b=Sgx4Hd7t/RaHjeot9to0FZJbg69DzCtbk3E4JQijbOL6WRKzProjRkyTJvxfdyLrA0
         MNndxcNIIvFHpnVEdiGykqkcLf4TUrFD8D6haDgQVgTvcuJM2EZE6FvVSI/OKrpCFeoP
         fkvdfGJmgR/xakZVyXfJ9D3ujIqir2k9ATayT2ATTHzm/42Q/glhPo5Yok0k0N3tYz4T
         jnPnB0Z0Ro1JhL8Ho0lmTpMa6hrpKv1XN0CCIddQv335vKPmDYtx97yMt5PYuniTRns3
         C//lwPmsm9N5RcBi5PXTso/FhhwcvrJa+eOZAvT6N9TdHl4qEOg+IgNV500RroAz4EIS
         n1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778504873; x=1779109673;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dy6auEdvCgEB/rpn78rKFNSXFt4boyLgJAQZRyoszRY=;
        b=Ar1c8CREA881zug3fxpJ75pMcMtUrWJ1wtgywDue/sFaFVcA42M963RG/LMLzKs2dK
         zQiLZTV4raTyVcSMyCeWbydvmCGcYw5RE52d/4s1/Wa7YXjqFsbxMGdZIhkjm54mdGHY
         ppcxOIw2ETlkl2dUJbn0mjusqR6J/70khhjup+yKAm+x3FvL3WfSgi4wu8YltqGwnKDT
         dgwe5lbkYzWB07MkpWXJiYvjqpdr8myuB8/3kmFlILkO4Zhh5Vm5UTxSLp8nOnQUQPGe
         eaijWj6OdU2g8En5CCo0sw2itN3sfMYnrHlcyy2BFWFrKrFvLjg8QfiJEvftI5SROTEV
         /KqQ==
X-Forwarded-Encrypted: i=1; AFNElJ8TBjDhnScgnkNl6BsGv91dq0QJz8JGiyP5LKGgl2f4RDvegAv8ltg0HmlWPDSAM5M4w8nGkOTNMdo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwswLCjO8ouS2aNkfu+wx3359qzJlwGtZi/GjJ2wvjFB3S7vsDg
	jm9EjmQ8lrH+0pqOb1md3Qfrd2APv8jgSYn0yIzSWRNdJ4ejw3fX7L+BOCTaTJ6sXhU=
X-Gm-Gg: Acq92OE+cvBQqTt+pjEp3pL8n4rraULL6K+lfVMTnHyyeq1uaQR5Sv0nXzAcfUuw9bi
	ip7QdMw6D2UpiAACYLfrRY1bD2iJku3yPTgx/NpiRXiHlHTG+6yOdqhnMGeijnJ0MPb8zHHBQHs
	w4oWrkOJLQt0BBA9qdtcbmidhH58uXsQY20DYWImCE0lUtD3K/fUGMS2xx1RxrfGIHptZ8T2FgP
	QpzKKaBG+zYgMy1FFzKHON28eMPQjw8RfZ1iLqmWt7b2SrsOKwYHgvqldo0+zpkZeXci/VUL8JO
	eybR8vku+EvPWSZ5fvfM3Fv8sLgSYy4MSQseU2LLYf+b4/jp1xeOjv+W9Rd2qQE5HSNvDf9tOQ7
	AWgPzIFiySR/64kXUsN7+LZWDuq9/VxcRd0arRJOwtctu2NZ9N2bqpAp+/aaLTJFazlFwUWEb84
	RPcVUEG7s/vD8bCPHJIue6Iw5kHVwCcy1kFQvp
X-Received: by 2002:a05:600c:4512:b0:489:284:44ab with SMTP id 5b1f17b1804b1-48e51e1deedmr377040195e9.12.1778504873215;
        Mon, 11 May 2026 06:07:53 -0700 (PDT)
Received: from localhost (109-81-87-110.rct.o2.cz. [109.81.87.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7040a9a9sm321328475e9.9.2026.05.11.06.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:07:52 -0700 (PDT)
Date: Mon, 11 May 2026 15:07:51 +0200
From: Michal Hocko <mhocko@suse.com>
To: Breno Leitao <leitao@debian.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <agHUp8ulaWJ75WU5@tiehlicka>
References: <20260507070547.2268452-1-sashal@kernel.org>
 <20260508135630.a380e3c187b59e4c04e6f358@linux-foundation.org>
 <af5Z2IvtS5pVorSl@laps>
 <agG_PZ3qcl6TwLnL@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agG_PZ3qcl6TwLnL@gmail.com>

On Mon 11-05-26 04:41:38, Breno Leitao wrote:
> On Fri, May 08, 2026 at 05:47:04PM -0400, Sasha Levin wrote:
> > On Fri, May 08, 2026 at 01:56:30PM -0700, Andrew Morton wrote:
> > > On Thu,  7 May 2026 03:05:45 -0400 Sasha Levin <sashal@kernel.org> wrote:
> > >
> > > > When a (security) issue goes public, fleets stay exposed until a patched kernel
> > > > is built, distributed, and rebooted into.
> > > >
> > > > For many such issues the simplest mitigation is to stop calling the buggy
> > > > function. Killswitch provides that. An admin writes:
> > > >
> > > >     echo "engage af_alg_sendmsg -1" \
> > > >         > /sys/kernel/security/killswitch/control
> > >
> > > It certainly sounds useful, but what would I know.  How do we hunt down
> > > suitable operations people (aka "target audience") to find out how
> > > useful this is to them?
> >
> > I'm not entierly sure here... If folks have suggestions on folks to loop in,
> > that'll be great!
> 
> I work with these issues at Meta, and this approach would address a real
> need we have.
> 
> While livepatch could theoretically solve this problem, it's less suited
> for rapid mitigation for a couple of reasons:
> 
> 1) Livepatch rollout is inherently slower due to the blast radius if a
>    bug exists in the livepatch mechanism itself.
> 
> 2) It's common to run hundreds of different kernel versions across a
>    fleet. Since livepatch is kernel-specific, a single CVE suddenly
>    requires building and deploying hundreds of individual livepatches—
>    far less practical than a simple sysfs write.

LP is certainly a more laborous solution. I guess this is quite clear.
It is also much safer option as it deals with all implementation details
like consistency. All that is not done for fun. I am really wondering
how admins are expected to a) know which kernel functions are ok/safe to
disable and b) when it is safe to do so without introducing unsafe
kernel state or introduce an outright bug that way.

Thiking about this I can see how waiting for an official LP can be time
consuming and sometimes creating those is far from trivial. But would it
make sense to have automated LP creation tooling available that would
allow to return early from a function and relly on the existing
infrastructure to do the right thing?
-- 
Michal Hocko
SUSE Labs
