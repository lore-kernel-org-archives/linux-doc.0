Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12132E8B8B
	for <linux-doc@vger.kernel.org>; Mon,  2 Feb 2026 18:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770056622; cv=none; b=ZQrMPlhjpq3P/Y0bcknL0+c0JHjwqn1jsvwkmNbeXRV9iTflkV3mWcpJfjfaL2G23XxqH+1CWTN4ZN0iMSt8sm9Dx9//o5xeLcmcG4WtxYji2s4Z8tmArPATLFZQUxApIrmJiVrDR4cRGj5ECvdERTbcMHomXaV0/pzK8wacpks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770056622; c=relaxed/simple;
	bh=ADF7ZKoCipxDP6UUmIGW/IPztV2DncS/DM4/x+XvBnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNFAhCc5FmRZqFBUgpXAUvhZ61BiOvSPflAO5fSw7BjY8w9AMWSlHJ4LlicY1ty9ODigcqKaZo5Og/6PNk1vEuEmF7/MkIJ+uIGa9+fdAvtSzC7D0sfOBvMbPuVJ5GgKLf7vjrtIs7Xm13JeKgJik1Va/OfcW7nXOOHjI/HiPow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=m/PkJmYd; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="m/PkJmYd"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-89476eaaf16so47273826d6.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Feb 2026 10:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1770056620; x=1770661420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MqsmEA1l4K6M349TDpqaFt5arK8yfZiMH/3re7GUwy0=;
        b=m/PkJmYdh+SVkiejGHPctTUuDdpJBcNsAIZWzBdakydEQcCbmMlnNODgXnvwL68Nob
         RxMUyChbgUnWoyxs+emVNeUcpMa6HIIFO2aZFRbPdoTetWp3qPj5aozzVhNUddUjrTmh
         2vFoCMVvaVkUe0j5ZFFI2QXnbCzD5iKTijFdvQBqjLvNCDzhZHmB1T/HbjmCsdjRXYhC
         aWoO4LiFaQMGtfpXMc2BSTngF0b35DYEPnS0vy5oQv+ka8nhGd1fV9yA+ps546POYEb9
         hXTYMlbhbG2f36ySY+oBc+1YPXOXGoQhg2bbnUxabLUjJ1bil+4pxaiZdFjxmQjfVZn1
         7L+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770056620; x=1770661420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqsmEA1l4K6M349TDpqaFt5arK8yfZiMH/3re7GUwy0=;
        b=haHOHorPePR3lZCFvd4KQKyZwUZBFsSeQ1+4+hFi1JVHrcqbMaMguG6+nWpeETSoIj
         fLshy1M/Pwnn4P16qfgESWaXA448UQWVRNLyRW7vQoKl3j0wrBnUpxZiS8vVs/SI3LOD
         tHNN3Yt7yvbVUvJowMkefF+3eJAFcrq7Xz8RRyBP7alK9U0bt5/hTFFRPfkc1zSO83V7
         okgGYY7XKOnogs+43D+32KEhlqhGd7sE9qeMJ3ZiPZuPaRmmeun8so/3Kf6rWBdOOI/a
         w/0mg7BMHM/hsfnLR0+syueBy3mF0sTomiJQBS3GNsK75h2S9p/8ziFSKrwHKdDTN+8C
         Ui1w==
X-Forwarded-Encrypted: i=1; AJvYcCWnVdq0hkWUV6r3qpPef9eHvM1gi+n1wPPUyTrV37SmHJbHk/CXDx1UvFzB/5+LaJ9shvKi2IJNv4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyategBHaNgKSrGytf3XMahAse9oR1IxfdpqL/y3mUaS8CM4Vud
	4uNCrnJle+DO79ZkQfpKUUdTKLSKQstnRIeQGhrY8hpVsXM+C952NerFSP/ZIDji52w=
X-Gm-Gg: AZuq6aIG2BLNuQ4r/YEdWnXmt3VgGSqwrVKqrwV8lcQw7+snk2HQwhy9MGD4FN23nIq
	++t0LND6XxDEWqA2yoPD0F2/ZGFiaAlxqyfjMmKMdwlkI4cEv59aw9FlTfWHnZ89yHlICjibR9H
	vefUz9ayZCo0A08k04ywHb/UzvUozBSEWxN14mM4sqTWUl0iyo8W6YmbdIoCFA9wUWRUoe7qhVa
	0Wv84U28awhoVrZW2yUdNQ4xGGf75q2pm6CeQlxMPw0dyr9vPKagjFVYjLiSlCFjai02TJd/77X
	bSR+ASSSLnDDtpgU/3j2v6YZNiypNCUH0kXyxQe6Knesssz1JBRHiUUIQkysma4t4drIdLOAYrr
	VnAhzs8cV/qwDZ187aKfW0ZBuMXJoCVRyepsKAnoZv1ZiHFYmrIiVjsgcHfO/l3AwFZIENBXvHp
	pfA2hNTwgxUyKffmkCw0S3pDl2XoujgI1RWvP5baM7J46mnBRta2PIJXpBlukNwF4fF5+fZg==
X-Received: by 2002:a05:6214:e87:b0:894:6558:58f7 with SMTP id 6a1803df08f44-894ea167cbbmr166333016d6.63.1770056619523;
        Mon, 02 Feb 2026 10:23:39 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c71b859eaesm1089477985a.46.2026.02.02.10.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 10:23:39 -0800 (PST)
Date: Mon, 2 Feb 2026 13:23:37 -0500
From: Gregory Price <gourry@gourry.net>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-mm@kvack.org, linux-cxl@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kernel-team@meta.com, dave@stgolabs.net,
	dave.jiang@intel.com, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	dan.j.williams@intel.com, willy@infradead.org, jack@suse.cz,
	terry.bowman@amd.com, john@jagalactic.com
Subject: Re: [PATCH 8/9] cxl/core: Add dax_kmem_region and sysram_region
 drivers
Message-ID: <aYDrqVEOwkGfv2JG@gourry-fedora-PF4VCD3F>
References: <20260129210442.3951412-1-gourry@gourry.net>
 <20260129210442.3951412-9-gourry@gourry.net>
 <20260202182015.0000325b@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202182015.0000325b@huawei.com>

On Mon, Feb 02, 2026 at 06:20:15PM +0000, Jonathan Cameron wrote:
> >  
> > +/**
> > + * struct cxl_sysram_region - CXL RAM region for system memory hotplug
> > + * @dev: device for this sysram_region
> > + * @cxlr: parent cxl_region
> > + * @hpa_range: Host physical address range for the region
> > + * @online_type: Memory online type (MMOP_* 0-3, or -1 if not configured)
> 
> Ah. An there's our reason for an int.   Can we just add a MMOP enum value
> for not configured yet and so let us use it as an enum?
> Or have a separate bool for that and ignore the online_type until it's set.
> 

I think the latter is more reasonably, MMOP_UNCONFIGURED doesn't much
make sense for memory_hotplug.c

ack.

~Gregory
