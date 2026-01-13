Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480E72192FA
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 02:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768271480; cv=none; b=q+JI/TuRk3yeZpTb5lRfriiUQQlH/j4d0OeiDOMkOE8qBibEGre2/CQUK+veQ3BtT2rHT+6xKOjH3p4t8QsjJh3gM9DVL4OLhwxbhhbO556xfWBwwMyUTBlo/a3m/QTQLxhKZnO9WbrzQnWxa/RoeLx2YPFYu8oasAUptYxOQIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768271480; c=relaxed/simple;
	bh=ho2dvKQBq0Yd0prR+DKbuQXF+nF7y3RBVfYCBex6q9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0AaturC2HJsgO9483sO/C7bm1Cr9kGUm5VNSC4k3zBK0Z3GP7RZaqGJorfsKdFmS/jrCIoBEcliNte2gmnv6EzZFW2OlzUWkpQ8lRDC3PiXQ4TE2y+va425GtT8XIZC5IRZNYFpjyvJcPXrI2GEbXQ4tPtHnU0kM2Av3AepYgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=pdZKgAGU; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="pdZKgAGU"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4f822b2df7aso96365231cf.2
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 18:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1768271478; x=1768876278; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C93O5nOVDkkg2FxJmCyd4hhnDoz5R8BWkurFehIYVAY=;
        b=pdZKgAGUXEm3VZ0pciIINV4grjX+DhshSHtrhrGhHeCDFv9e2hSXTcnz1RooWeOteV
         B+1f54lQOQuwhgnfS037/AjrwN0GP0wVq16lKAPFJoLgcXGM3GOTwkvwoGMHj/mZGy3P
         Px84ey32+Syoui1/tt7NQ1REPmkUkrpIJupf++CgtaTu2uNT7F1JFRgiTftUgkVmqE6A
         ngQcIyDUi66KUvv1+AqMjCS/fK5XTpktGvYMD12rUz974ovU3ZQrKUQifeWoECIEY8PK
         Hm6DIEE+jW7nRYCJk30m9cABlHXpsOWesA/4cUwavLEZbwN2bG8dhqMcYcRiP+0Is7I2
         FG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768271478; x=1768876278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C93O5nOVDkkg2FxJmCyd4hhnDoz5R8BWkurFehIYVAY=;
        b=tj5wvrnrwCDW6755Ab7ux5Nq/PYghWxpDktD3HKhyVMNqJ9npbEjHQ4UGua4xXRr6m
         PynjVbEJN8TTikii067tIPmYwfmr8hHwv7Cs9ysXNPd9XDMPZahBIj8MU4HpwPiyKTR7
         Jfo/H1qI5616KqRoTO880prDP5VaoEMkx56f78fsEpnuEbLKF47la+gu8ZDFQLa5kGFG
         aJy5SFz4xAbwsAiBsInVL8QWF+cV2e62ZrLu3a3nzoPV5hj5fnUtwFLxrkmSkcagkt0k
         PYkgKm8FWaHDr3eDsLJIFjqnJdznaaK7Zjw2nwvwPCFCqeBIL4vTqr9m0dTAVJ9HoYWu
         tmLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy98Gnc7h+La6QeySyqL20xen37sShCPs++iBFxyVVMcB/vfLNfmeXMCEgIY9qtJ10gLuqYoZEX1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyicaP3QQnZwNLU12EoiGumA+qchiK0NoGuAmE5N3jZ87Y+Ku8Q
	2GB0tJrThfgioQXdTmhilZnfdLl7R3/4Kyw3Uzh+vT6ZYs/ziRun1djiLGQjLyMi3RA=
X-Gm-Gg: AY/fxX4IZ0zd1xL78tc2qpIksWKda18wNki0CDs3KjpBaWwEBXdrqOUMA2gK0xun3Zv
	drF2pm6o437w1pwDBLxsRURri/HB5zfswaFlajbNfkD6rQvOljlaUEsiPpkOUe3RhJSGaLccPmC
	FVsnRQtYYBPF5j+VBPD9kRUeENsDeC7SXOVtFaURrElN9gFG45366BMOHOKd8NZEZuEu5KZTn5p
	ppxLpR559LRqganDuzlphCB683QwCzjEL2rz4BQBW1J2rNgRQbwuPtqbdqgyUht2GpYCSiy2/Cg
	EuhXV3I7XRNzwumEynAVQK84mKYHOSOH+CXE7o2sVHqENwGuws+mrIU2sStd6w8ZJ5ne3GsLtmG
	11o4QvJNGdqGaqh+HMSaCFxQmhTPYcnXAVqVXBKxK58HpO/0W29dAd6AMrjebMdwqjUMI0R/YYE
	IyeSdYIP+pIyUtwWlGIGFSejUShIptOKg37uhg1fVqu5L849yKEt9p3BQmG1Pa3WtLozwgjg==
X-Google-Smtp-Source: AGHT+IHCPi4MK9/Ik3dfsfDzq1ju/aCSzOs8EU/3afAsNmDf9hjv1FD2hLSAdQvv7O4wE1FSIssF8Q==
X-Received: by 2002:a05:622a:4247:b0:4ff:8500:7881 with SMTP id d75a77b69052e-4ffb484a753mr234149851cf.15.1768271478154;
        Mon, 12 Jan 2026 18:31:18 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa926a9d9sm135952921cf.25.2026.01.12.18.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 18:31:17 -0800 (PST)
Date: Mon, 12 Jan 2026 21:30:43 -0500
From: Gregory Price <gourry@gourry.net>
To: dan.j.williams@intel.com
Cc: Balbir Singh <balbirs@nvidia.com>, Yury Norov <ynorov@nvidia.com>,
	linux-mm@kvack.org, cgroups@vger.kernel.org,
	linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	kernel-team@meta.com, longman@redhat.com, tj@kernel.org,
	hannes@cmpxchg.org, mkoutny@suse.com, corbet@lwn.net,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	dave@stgolabs.net, jonathan.cameron@huawei.com,
	dave.jiang@intel.com, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	akpm@linux-foundation.org, vbabka@suse.cz, surenb@google.com,
	mhocko@suse.com, jackmanb@google.com, ziy@nvidia.com,
	david@kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, rppt@kernel.org, axelrasmussen@google.com,
	yuanchu@google.com, weixugc@google.com, yury.norov@gmail.com,
	linux@rasmusvillemoes.dk, rientjes@google.com,
	shakeel.butt@linux.dev, chrisl@kernel.org, kasong@tencent.com,
	shikemeng@huaweicloud.com, nphamcs@gmail.com, bhe@redhat.com,
	baohua@kernel.org, yosry.ahmed@linux.dev, chengming.zhou@linux.dev,
	roman.gushchin@linux.dev, muchun.song@linux.dev, osalvador@suse.de,
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
	byungchul@sk.com, ying.huang@linux.alibaba.com, apopple@nvidia.com,
	cl@gentwo.org, harry.yoo@oracle.com, zhengqi.arch@bytedance.com
Subject: Re: [RFC PATCH v3 0/8] mm,numa: N_PRIVATE node isolation for
 device-managed memory
Message-ID: <aWWuU8xphCP_g6KI@gourry-fedora-PF4VCD3F>
References: <20260108203755.1163107-1-gourry@gourry.net>
 <6604d787-1744-4acf-80c0-e428fee1677e@nvidia.com>
 <aWUHAboKw28XepWr@gourry-fedora-PF4VCD3F>
 <aWUs8Fx2CG07F81e@yury>
 <696566a1e228d_2071810076@dwillia2-mobl4.notmuch>
 <e635e534-5aa6-485a-bd5c-7a0bc69f14f2@nvidia.com>
 <696571507b075_20718100d4@dwillia2-mobl4.notmuch>
 <966ce77a-c055-4ab8-9c40-d02de7b67895@nvidia.com>
 <aWWGZVsY84D7YNu1@gourry-fedora-PF4VCD3F>
 <69659d418650a_207181009a@dwillia2-mobl4.notmuch>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69659d418650a_207181009a@dwillia2-mobl4.notmuch>

On Mon, Jan 12, 2026 at 05:17:53PM -0800, dan.j.williams@intel.com wrote:
> 
> I think what Balbir is saying is that the _PUBLIC is implied and can be
> omitted. It is true that N_MEMORY[_PUBLIC] already indicates multi-zone
> support. So N_MEMORY_PRIVATE makes sense to me as something that it is
> distinct from N_{HIGH,NORMAL}_MEMORY which are subsets of N_MEMORY.
> Distinct to prompt "go read the documentation to figure out why this
> thing looks not like the others".

Ah, ack.  Will update for v4 once i give some thought to the compression
stuff and the cgroups notes.

I would love if the ZONE_DEVICE folks could also chime in on whether the
callback structures for pgmap and hmm might be re-usable here, but might
take a few more versions to get the attention of everyone.

~Gregory
