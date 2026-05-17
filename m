Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8643CF053
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 18:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779043043; cv=none; b=ECYTv8awtpgCbJzKOP/xeLP3EfQbeXeFjzi25Ro0wi43SAfEzc/BB5B4Alh1iiHFxTGj8RLJxKh+C0WA+tGmKjo3gR6lVHQFO9IKNvjXDHKx21oy/8M0wTdaQKFaVWpbmiuNKpBsExDpQpbSimA34NxkNjlH8a8HK581c1MtPVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779043043; c=relaxed/simple;
	bh=ODINtDFFV5g4mSz8cJVlLxEbZA37tQMcdVPH8vgGrAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPltsH5BxqRbuINfJAXAlSyDXaSNBw55GPY/CmfG1jT4sWGVz4fO8bMD+RPhq6Rd9J2FYGMLS9Q+nfoHwjw3uSn6iutqU/uhVRVD1Wi+vpFjMXU84PFkapzb0ghk5GtWQmOVyI931DHB72+zwiBWVHXh8KtbLi/egfn4S2mqVyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=ea0x6hxA; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="ea0x6hxA"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-9116861f004so426097885a.3
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 11:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1779043039; x=1779647839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qSvR3pUa7/2OkCu/xeQoYakjb0Jx3U+q13XWt8GPix0=;
        b=ea0x6hxAjQoGtU2KeJgS0o4Lgf2ssyGAeoMpbLf72HISJVxxWFNRNVbJzh0KrJwgwd
         6mP5e4l3NNqGin3xB2bKzKpKHhKGlZ6KOQHKxnTV5Ye2kI0mqMvmRNIEsPR64sEKLMfI
         4bZz+vM+dSXYaQro9O2g92IZVRVnALgJm7Gx8xrJhl7HAWHuJICVygKuVTQBDs1Ci5d4
         HqCMg+C8WXW9oWudSEcH1FkTts2JPH8eCTKOXOlqRu5Cx3OtgmC99ieraJrVbIGMtucm
         maTO2HwO7k72O1duqD0KDZwOTwTxiV/hDnV/F6dffSgyFHpLAR6BMKZXFsfNV1V0Nmot
         ja2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779043039; x=1779647839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSvR3pUa7/2OkCu/xeQoYakjb0Jx3U+q13XWt8GPix0=;
        b=mlRVQZoS58BR27Fe/+Oa0zu+jvc5PcWCxHI2kZBp08A6IvRen/g0GadAJlUqpGcqTc
         08Ip3Hm1MZAH15jGzvelModXmOsm4ddrfStbeCAIsllkVcQIi6RF2yCGQjowJe5Nkkh4
         A1UsC5LSUA+CDt5r04KR/A9Q0T2QbW1Z79jJfSv0xJs23xEST8+2qc9C0pj4cLOBt42E
         bhGmLvlUInFWMWFidvZ2uErjvliuUIEoQ2pu97u9zQhXA2/H573dLFAknXVbcrFtH8UN
         AAmHFHBDV7PwcRS2pVl1jroi8No9va4/bJYYeWNFyo7UYmCDXHusjfZDCXS8tFjJsGUl
         7TUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ObQ6WSBh1VrhIPTfZcYoYDgyHSZMROOF0roMBCH7+/i+kDyMxA40qNqyqb+QNdu4QtyUQv9eK23o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlt2nSgVRhF62jH9DxW/FJDWOg2n4Tn+ssD/nHvrqBDO7gotIm
	jyMTYVIBLxOCikKMjHnA/hGuUFMcLYAuqSSnJ5fBwPuFNXjJppfBLSIwg/DGI5K4FZY=
X-Gm-Gg: Acq92OFbefKznVwJ6r3XtH3HRB0DYT/FIhpkK1kPlMcDWRZqfs0UpAwqhmV2GbVmyUg
	C6nbjiDLhfjB3II89rzs/9XZPMAkcpukMxuPSmDYSurYbtVJuu9WIHZ7txt/J78kOYOpbZVRBqe
	tBQvOMeJuu4wvQv840CNzLY+NAXA+ERJsVzC0Nb1UAiyEJGePVAa20hFSpsycg/rA76/uln3Nzp
	Iqm87Y0y61vbJxsHICdwR9+QV24W3Zv1ymhiIJkngiBtISElASicJV2hM07ReSM01R30e396BfO
	V32D+W3zp0DWNHexnRa8tCyGuWwiX29yHGxovjLvFR17v7cc6Hxrz0zLgODgvLOTmrLCCVix142
	64y+WNTo2NoNsJtmo29KrrhgpemV24d9DmXjACr/pM8R32Ch5cwr6uSP8tKGqyg1ecZZNJMvfJm
	Z5AYHAW246KDy99hw6/76JUypA1WMNp1fuMVAFDKbpCMvRJTX4AFU=
X-Received: by 2002:a05:620a:258d:b0:8cf:c513:349c with SMTP id af79cd13be357-911cdd431f7mr1842710185a.9.1779043039579;
        Sun, 17 May 2026 11:37:19 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910ba36e1acsm1238613585a.3.2026.05.17.11.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:37:19 -0700 (PDT)
Date: Sun, 17 May 2026 18:37:18 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	corbet@lwn.net, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH v2 02/10] liveupdate: Extract luo_file_deserialize_one
 helper
Message-ID: <agoKzw8mR21K7cCJ@plex>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
 <20260514222628.931312-3-pasha.tatashin@soleen.com>
 <agn50TRvhDpGm_9v@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agn50TRvhDpGm_9v@kernel.org>

On 05-17 20:24, Mike Rapoport wrote:
> On Thu, May 14, 2026 at 10:26:20PM +0000, Pasha Tatashin wrote:
> > Extract the logic for deserializing single entries for files into
> > separate helper functions. In preparation to a linked-block
> > serialization for files.
> 
> It would be nice to mention that this is a pure code movement without
> indented changes.

OK, will do that if there is another spin.

>  
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  kernel/liveupdate/luo_file.c | 77 ++++++++++++++++++++----------------
> >  1 file changed, 44 insertions(+), 33 deletions(-)
> 
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 
> -- 
> Sincerely yours,
> Mike.
