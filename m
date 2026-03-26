Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EFB3CD8B6
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 21:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774561340; cv=none; b=dvfNYGrkn/5Wd97Qef7Ov6BLnhqUgp/JCbab2AWa4l6tVdb2/Tkon3UfFKOixNfLPWJcChrZQ6XbUbIwXVcRwx9VVZjNkpxkfFwG/FcAa7AwKoUh0lNdCelvN48RL298JPaNa7u9YitMT20A77Ba9a/GMpJxhsB44Kpv4dVsgv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774561340; c=relaxed/simple;
	bh=ZQN8j2vVjQBiZh6/tfAbQIu9SGxAiQ84Ck8/o0Q3n2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9YgRt7uW9ryEeYCt9J7EaQwCvVLBYF+MVNYstZZKchEkmYqvIY7tNZDYhhwEyyxxLrNZbbtz7nheyGluxyMyJzHonaXxczY0bywLbtzHGM8a+k4bXaMeZ/WNUCDtPS3GkiRY0mvWSsIZih0w5N/GsSRm138l3+O2xBLNDE16QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITOVA6KY; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITOVA6KY"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12a693cdf29so2170290c88.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 14:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774561337; x=1775166137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TsQAC8Meu2U/HZ8TJa0R82yXNZF53pGbPU4ManvaCKY=;
        b=ITOVA6KYhdwfMYFXtlxqlutZX/Tij0fgmD6KCY6dxojpwQd1FzKnf0LB8Or1vesB2F
         Ei8qpzw7hZvGc9OYyr/r8JrTI2EC9+es85opsBaPsSHApV4LCm9Sdu2FGfp8WocnTJ2x
         tSiQ2K3LjYXe3ncs1xUwxq63wwfNfsAAJ/TC6fyKaNaQDBUOYPHv+OMg9KXikVkioEAv
         m8kL0wURpT5+i/WKCa023hllWqNKDlNU9DwvcsvNzTbyeegw+ONI945eK6xvDq3/kSm1
         tymxS39rIQY3xYYLgV1xXN9tIj8r7iqOVS9TY0/+K7yTqEOGH1Y3ZOGl/kybTK9+YYqK
         Q8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774561337; x=1775166137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TsQAC8Meu2U/HZ8TJa0R82yXNZF53pGbPU4ManvaCKY=;
        b=Ym1GXE/n6Wbf9VlYbz1skFRYwiu6h+moR4F9g6iX5Kg5lHY4nwzZO1djNUocXEV56w
         4T4QEe7HfKtW3RAObFGNycy046Qv1loCAjV46z2gYSbTuSSGbf2JnKBZwKxp9td8lqOk
         s/QCZQjeA1ja/o85BgvXVusPASBObyA/zpvwzbizSd+rmW+YZihY/GP6p0wFWLQ+BmbS
         3IL4aXbmGj6wMbqVpzeIhPulmBKdwpVb3HxTxhFqaoce7ylr5dz/T56xUuaquStUjYJv
         hxnEW+et02/GdhModxO2EPrcHyp8TTuQY9vyvBrbVMuajc070hIuSk6/gUvMjZlI+9zn
         bT3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFfbIamf1ow31e3o0ZFyuZVJ/KqKO8nefMPh9UVDFXIBJo/vhBCItwFojllSV44RFqtkk+Iamh/tw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAlvYl1l1gPZYIryvn4xc5qmckLKMRvt9TXOxYhGFeBHkRRoSe
	AflZrYnXNLC1AmbeLtT3lCm2PPS6iGwmcMqUP3zA+ioXKWYlMTjQJSnv
X-Gm-Gg: ATEYQzyb2qd0ZAIrX11eiPUE8MGmycpxfWu9H6isswycjZfPhnkkaugBfCTQ4XxbERM
	VqJFBDizMbOSN9JuHs1DUMcJQLG4m+9p1w8TZHFBulWVlLc+E7JvQRNWjUF0dQG1NT+7ZqO2ZQ6
	ZXiUDtBxDvU+/TXdw5LWifHEICUNruWFDomd6BkWj8C9eppyUlYaVm8zVDMaykBgFvoo5E8Csig
	77eg201Do+uY/1lu/ZmpcXlMJCjMkJ4Yvf6Zvb+VwTlVBm0TXDQhrttve1rxEW50f+umjMjclM3
	4Ly4NtxVI1oXjskEPPN5oMGXL2x1qv1aa5aHGOhp4fX4bym0nVs+IessXCovHIQQ2UHkGB8SFnr
	i8qGA4WSNCIWmAlUXCUp1wCJht4KJ4GsvHKyk/ChKs0cMlcSzU9pHsDJ8u/pCwFQxS7Oirac9CH
	aerjd1WHYb9wy1P6l9PPSp8tszSumRUm5C//hsNXHPS5aRRpKaHQ8CTQwQODdh6oyt
X-Received: by 2002:a05:7022:2209:b0:129:1d25:f1da with SMTP id a92af1059eb24-12aabb0ba74mr1425343c88.3.1774561336810;
        Thu, 26 Mar 2026 14:42:16 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:c497:6d9d:a11e:c553])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa7624247sm5452875c88.11.2026.03.26.14.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 14:42:16 -0700 (PDT)
Date: Thu, 26 Mar 2026 14:42:13 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andy Whitcroft <apw@canonical.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] checkpatch: allow correctly handle full files on stdin
Message-ID: <acWnbG3nGjfYeYXh@google.com>
References: <acTPXMJfkHLeItrK@google.com>
 <bb47800754aa3279e88c9d88c380bcfe6263fb2d.camel@perches.com>
 <acVIBseRrqJI8Uwb@google.com>
 <117b6a4c164a9f0ce348044152d00ac22b31b81b.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <117b6a4c164a9f0ce348044152d00ac22b31b81b.camel@perches.com>

On Thu, Mar 26, 2026 at 02:36:35PM -0700, Joe Perches wrote:
> On Thu, 2026-03-26 at 07:53 -0700, Dmitry Torokhov wrote:
> > On Thu, Mar 26, 2026 at 01:46:49AM -0700, Joe Perches wrote:
> > On Wed, 2026-03-25 at 23:20 -0700, Dmitry Torokhov wrote:
> > checkpatch does not handle full files well when they are passed on
> > > > stdin, because it does not know how to treat the text, and whether it is
> > > > a C file, or a DTS file, or something else, and so it assumes that when
> > > > it works with stdin it should be a unified diff. For full files it
> > > > expects to have a file name as an argument and read the contents from
> > > > disk. Unfortunately this does not well when trying to use checkpatch as
> > > > an online linter and feed it contents of an editor buffer that have not
> > > > made it to the disk yet.
> > > 
> > > Why is this useful?
> > > Why not save the buffer and then feed the file?
> > 
> > Because when I am editing a file I am not saving it all that often. I
> > want to have buffer diagnostic updated when I leave insert mode in vim.
> 
> I believe you are able to keep your own version of checkpatch.

As well as my version of the kernel, gcc, clang, editor, git and so on.

Do you have any constructive feedback? Right now checkpatch is broken
when using "-f" with stdin and I offer a fix. If you have a better way
in mind by all means share it.

Thanks.

-- 
Dmitry
