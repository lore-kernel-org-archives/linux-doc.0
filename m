Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD7738C407
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 09:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531006; cv=none; b=ebFZHAcMldYoIK3w8yD27e7REmy0etEVo4yIQMHGVuKiHb3GFmT3vW7Na8oIlTl1FN/Ei68pCIoX9XQztm7Zjtvtji3uUOKrx0Hrs5ksZUu3fKaNrDigEVVDi+JCxRTeuH+2UZTfhdRU8/E2sN5U/4di6I/t4MSPT3hNp+QLrcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531006; c=relaxed/simple;
	bh=1Uy90Z68IBOD9G3SwFMH1MRhF90lWRNQ8AzSn74XNWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H9MfwpKSQpAE8JpYMEKAh4r8IoTgiCWBPsDTyG8/mXtSEuYAVc+WkGf2vY0JPVDZS0sgugjrA0/rADvFML+bZeyskWXlwIAimjEOqRzrscBFsfAJtJxKiSdYLmjknbB1z4HXNpF2HA94afI/jMm2nzDs1c6cpSn7MriqeBq1uf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aB4jSHLF; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aB4jSHLF"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4377174e1ebso4006448f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2026 01:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772531003; x=1773135803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1OgDgZ0NCQI8yFPsJ1mKpI2h13qQh0QIfMa8oaHcgzg=;
        b=aB4jSHLF9h7CA6tutm2EKnrQCnDbjN2vScOY5u1lYplfRm9ixk2GPqrCou7qV97YNf
         4gaRUR81IB3mSJs3QdpmX+4uJji00fLfTJd0chkY8VmlD3WYai/hbIhyn17TnuqHAAq1
         g8+AKxW/xa73UKKK+0GbYfTeP5G5Qgj3AFnkVvH4yOguNagG/xNWfYDHWVB6pQfD3PWR
         YkV5ne4vcnc64o4Po5fISKwoaoR8XXR7J7PIwfICRz3edaxy5XSwFqAePAvIbmRooU29
         8wUxC1YHCcVxFpHBS+iz8CjYqr5kkuw3DGnKTm+cf6YYbwvfxiMjCD7ksq1WIePwbz5f
         uejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772531003; x=1773135803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1OgDgZ0NCQI8yFPsJ1mKpI2h13qQh0QIfMa8oaHcgzg=;
        b=qvEfEj+2ZLXjafjZ2Yc4ABp5CMmUiGFbGMlBwJT8IM4XnF5VxbfFM1/SMBNJn8Wcr9
         7i3pn/iE6EnpHP5OpOFrRwFULV9n/NivRXi7LTkxVIKh4ZbjJg24OGah8hEi7BcQgAzh
         wvbeaI4x1x6X6FWtRZIEjbnm5XmpuBOyLUnhdckDQ3JNkZz5TLgvOsuPEWOmooINIEK3
         T7gr3//ug7BDkzhpDs6Lp1jbgVJZwb4547+Dht4a5YasAajiLIi27bATliECviJ5psk+
         Jt+7KhX0xb5mzF++9xtW6j46LIGrANun+1+3yDKYmgJyl7RCLMp5JjFWJtfaKmrr05CZ
         5C3w==
X-Gm-Message-State: AOJu0YzH+tRvxXk7N3rTc3bUMp5tiMNUL5ZsZb/MTulJgfHG9YuA7p7M
	nvex4ysmWtV08VX4mvoSkMVdZa5YpfM8Gt+4106hDS7qfyMtw3zEcGmvZqfknmQblY8=
X-Gm-Gg: ATEYQzwrb7yfyzxO9JI1zMuou8uWatXPSp8dKCELPo/2j0tdEFcqblKtf/+NXd0yTvA
	W59IYkWkedYTkmuFwUc/bJNKxv8az406IvGbs8bJ8z/mASqHsVpUCJTZDMzK+wL0aiX+U5DF39c
	p13reDvZT2/hHDeHDPqrYnL8Q+mJZC8q0CfDLSFzOj86PG8Ry3Ka7KWcJ/BIHMlO5MkxtS42R5Z
	NPPKgw8y4WcVdgdsVLTuyWsYpn6o9em25HNddHZzMZMdpDBVyEg5echvueorNigzhFXIKqCiYSf
	Pkc/CMcLvqigsz/kcXJtr93q4HQgI5gwqkWa/pPwuZejfvoT1r9IpXQAApPbR9EPMMdwa84NyMm
	oVC2ssjpXILjzr+RA4PuY0+jLF+Mz9So92NP4eylqlVg+KFaQwjtedt6lg5q7sjWzbQUHDd9QKm
	/B2y48+Q+tDhp/6agRMFlbX0cHgA==
X-Received: by 2002:a05:600c:3e16:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-483c9ba38damr289723825e9.7.1772531003257;
        Tue, 03 Mar 2026 01:43:23 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75dfaasm419063765e9.12.2026.03.03.01.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:43:22 -0800 (PST)
Date: Tue, 3 Mar 2026 10:43:20 +0100
From: Petr Mladek <pmladek@suse.com>
To: BACKPACK <3288824963@qq.com>
Cc: linux-doc <linux-doc@vger.kernel.org>,
	senozhatsky <senozhatsky@chromium.org>,
	qujingling <qujingling@huawei.com>,
	zhangjiaji1 <zhangjiaji1@huawei.com>,
	xushuangxing <xushuangxing@huawei.com>,
	rostedt <rostedt@goodmis.org>,
	"john.ogness" <john.ogness@linutronix.de>
Subject: Re: [Question] printk-basics.rst: propose adding warning about
 high-frequency printk causing lockup on serial console
Message-ID: <aaatOIcngZgv9_-T@pathway.suse.cz>
References: <tencent_A94FB6382BF9A2F5117BB565262FBF41700A@qq.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_A94FB6382BF9A2F5117BB565262FBF41700A@qq.com>

On Tue 2026-03-03 15:34:18, BACKPACK wrote:
> Hi linux-doc maintainers,&nbsp;
> 
> 
> I'm working on an embedded/arm64 system where high-frequency printk() calls (e.g., in network RX interrupt or timer handler) occasionally trigger "hard lockup" or "soft lockup" detector, especially when console=ttyS0 is used. The root cause is that printk() may acquire console_sem and flush logs to a slow serial device, blocking interrupts for too long.&nbsp;
> &nbsp;
> I'd like to propose adding a short note in Documentation/core-api/printk-basics.rst to warn developers about this pitfall and suggest alternatives like:
> &nbsp;- Using tracepoints (ftrace)&nbsp;

There is also trace_printk() which can be added in temporary
debugging patches. Note that trace_printk() should not be
added into the mainline code, see the section about trace_printk()
in Documentation/trace/debugging.rst.

> &nbsp;- Rate-limiting with pr_xxx_ratelimited()&nbsp;
> &nbsp;- Avoiding printk in hot paths&nbsp;

There is also pr_*_once(). It is a good alternative for hot paths
especially when the reported event should never happen.

Another trick is using less important loglevel for less important
messages and use console_loglevel to filter them on consoles.
There is a patchset which would allow to define per-console loglevels,
see the last version at
https://lore.kernel.org/r/cover.1764272407.git.chris@chrisdown.name

Finally, the risk of printk-related lockups is lower when using a console
driver converted to nbcon API, see CON_NBCON flag. They flush printk()
messages flushed in a dedicated printk thread except for emergency
and panic contexts. Unfortunately, most console drivers have not
been converted yet.

Note that the nbcon console drivers might have another problem.
The asynchronous printing increases the risk that the messages
might be lost before they are flushed. A bigger log buffer might
help in this case.


> Before preparing a formal patch, I'd like to ask:&nbsp;
> 1. Is this the right place to document this?&nbsp;

printk-basics.rst looks like a good place to me.

> 2. Would the community find this guidance useful?

Yes.

> 3. Any suggestions on wording or examples?&nbsp;

Please, write the documenation using an imperative mood. Especially
avoid "you/we" ...

Also note that the documentation is written in reStructuredText (.rst)
format, see https://docutils.sourceforge.io/rst.html
and https://docs.kernel.org/doc-guide/sphinx.html

> &nbsp;This would be my first contribution to kernel documentation, so I appreciate your patience and guidance. Thanks,&nbsp;
> hujinfei <3288824963@qq.com&gt;

I am looking forward to see a patch.

Best Regards,
Petr
