Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26893514761
	for <linux-doc@vger.kernel.org>; Fri,  4 Sep 2026 20:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788553523; cv=none; b=YvmubrWJXsAYk7gLkKhhztfW6msMsIY0QoLXfuDHn0wR9Sk8qjbmc7FbpyF2/JVje+b0NvYihVcoduD/0UP4uOVqFQPyeBP7w0Xk2onqYjgDgNlx+ni6MmieC8ga2JVyO8/LvXCC3UpBc1GbKMj1JlDZ5saOCtWOWr9IoOWZWh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788553523; c=relaxed/simple;
	bh=RkC7B1HjR0ml1UrF7WPIGhZi8gjG9mXWmeILFQwtK2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STmKFSVDvhSZh1g7mdNNqsWc5XXnvDPxwEwAnDVeVzZLMYdPEJn/dhrGreGeKtpvRYEGA1DJUhWGYSvT8Sj5+k+vu9L5iiZcN+28EluehXBJCNTW+pnBuxl+XCykbNKLxJZCUqdTuCHfxDSfqq/izgy37jW0cB6m5kJ3Vs7iT9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AdzKKqbg; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AdzKKqbg"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso1600777a91.3
        for <linux-doc@vger.kernel.org>; Fri, 04 Sep 2026 13:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788553513; x=1789158313; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N6QGXZnzimnwApACmTHrGvREBiPCHGg32ZkJMN7Mvro=;
        b=AdzKKqbggCp3BNgi9PaPZMwv5Rw8w0GYbLLvzLEoe+pWtHJZSSqs7Jtm01N4h/JuLJ
         wYo/90wEeX9kdGC6s12QViYIuA7SUUtrHHJVSWpCd8DshU/e2GSngORiHNoisGR2n8ZI
         d9BYHKJHsQXfBgRHIt3yvepyyCAHQayv2jVltVvgsPmkqlwJ6/7pbbRQ6XeaJBC7q5R7
         wgFfJbYl2grZ+49dBa+jy4ChLzV0ZAaYs5zU/7ddMcMrJma+P13JDjuq7R3DIlLhS5fk
         fvBodQ60O4a3klrYnVs1fLsBhofAvDv++5mRXRlUrvAZeqO3en5N8g/appN07KIF5vc3
         1Aig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788553513; x=1789158313;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N6QGXZnzimnwApACmTHrGvREBiPCHGg32ZkJMN7Mvro=;
        b=m+TUr/0vF8mXhvuobRePlFUArT2LzRBoap5Iv+wqEbFlR+KylIedgaVPA9ly3f1gal
         kG7LoHxHzIp9r0mWTYUTw28jBTo9cv471/mSHulG4bCHHRXqtexKxFYtXekNWPekjhae
         ES5GwMbrY93iTIqSoLl8f5RhrO9uLoFHlGCW+qKylm7VjKZAekXxlY5wAmpjI4/9Kk1D
         ZZWB6hPps+Rs6OwFLl/+LxwxRU8QkpXhaSnbMqrg+e/6tW+/3m3P90SR6/0HesYMPFJA
         14PYNLpz35ymGuobykMThmirRhUkI74nqUFZisqOzuRQ3QO+QYYZpxHc8wQ1glmIjiMz
         sAZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSRyvr+Ao4P8exJ3fkDtcdtqH/6V4OC2B2i5yMsDmJps7xIdkgfs2l/dz3c3sq098JNN6nfWCHBr8=@vger.kernel.org
X-Gm-Message-State: AFuF++l7LpvohPfGITCFXFzKmn24GKm77euxvvMAPPFnVgKcRqjVsUlx
	szQTIVxZfPDuWVTF4ezazs1d763u8TUtmaYZ0ip/VAnIAK/0wIA1/upQ+ytOxwDfkcU=
X-Gm-Gg: AYBFou1dSh48zk1cvBpm+pVLt6SOaNKRTFBYuS3J/uq23qFG5QUdQ0857obmaOvXRI+
	nV/OQb7eeKjQg+bwWezx+0hCnRpAZx0yDsm8xLGROlCc20BYzfxIGA1lNJSCy+BIJMsLSsRgMWD
	b5oLxj7B5GXe5MG3r3g4qSjE/8oirwjdJ9hW+Q6enYCV0c2bwEZ9QhqKEVmE3h0MnPcmA+WltTK
	lRQ0Ecs9aQn3BT+Zft1tAO0K6hTXTT1PKEnoZXS/5Vi3j5WYY3tOrP+XIZluy+mQONtDrI6Sb2i
	+a9+brmwQH4iWGvcTrcZmWWXhDYq4Y+jrNA6bb6E/4vCtnmsacLc/clBlk3MWxOzt1vI/bIbsHq
	7g8oCA984xJrVE6wpCKe0ye4mlKv1mNxIqLKiTqvXXnM1QySR8yyC+E4ks3jw1crBFsbrCjnnOw
	w1GpCJJOno8ZTDvPIFhF/9sqPLZIuuNKT/N0nthLnY4h8kd7JNXHYnR6EEW+gkG8eA
X-Received: by 2002:a17:90b:224c:b0:398:9bd4:d15 with SMTP id 98e67ed59e1d1-39b26245d08mr11013302a91.20.1788553512350;
        Fri, 04 Sep 2026 13:25:12 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:f95f:75de:b3f0:3bf5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b26127fddsm5795159a91.12.2026.09.04.13.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 13:25:11 -0700 (PDT)
Date: Fri, 4 Sep 2026 14:25:09 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: tanmay.shah@amd.com
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, andersson@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org,
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/5] Enhance RPMsg buffer management
Message-ID: <apspJRn0LJ-Gvucv@p14s>
References: <20260828145853.2843486-1-tanmay.shah@amd.com>
 <4f8cc4b4-8c44-4d2d-befd-63911afe27a5@foss.st.com>
 <20f53e0f-4b9a-44fe-bb6a-ea0f988b64b9@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20f53e0f-4b9a-44fe-bb6a-ea0f988b64b9@amd.com>

On Thu, Sep 03, 2026 at 10:28:09AM -0500, Shah, Tanmay wrote:
> 
> 
> On 9/1/2026 8:03 AM, Arnaud POULIQUEN wrote:
> > 
> > 
> > On 8/28/26 16:58, Tanmay Shah wrote:
> >> Current design uses fixed (512 bytes) rpmsg buffer size in both rx and
> >> tx directions. This design is not suitable if the payload is larger than
> >> 512 bytes or the payload is very small and doesn't need that much
> >> memory. Instead introduce new virtio feature to retrieve rpmsg tx buf
> >> size and rx buf size from the virtio config space in the resource table.
> > 
> > This version seems good to me, with or without my suggestion in patch 4/5
> > 
> > Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > 
> > Thanks!
> > 
> > Arnaud
> > 
> 
> Thank You Arnaud.
> 
> If I end up spinning another revision with any more comments, then I
> will address suggestion in the patch 4/5 as well. If I get Mathieu's RB
> for this series, then we can merge this series as it is.
> 

I edited 4/5 to include Arnaud's suggestion and applied this set.

> Tanmay
> 
> >>
> >> Changes in v8:
> >>    - fix commit message of 3/5, "%s/enable/Enabled"
> >>    - introduce new function to get buffer size for the vdev device
> >>    - fix description of VIRTIO_RPMSG_F_BUFSZ define
> >>    - "%s/or differnt RX and TX sizes)/or different RX and TX queue
> >> sizes)/"
> >>
> >> Changes in v7:
> >>    - Fix 5/5 commit text, and move change log out of commit text
> >>
> >> Changes in v6:
> >>    - remove buffer alignment from config space
> >>    - rpmsg.rst: modify alignment related documentation
> >>
> >> Changes in v5:
> >>    - fix documentation about alignment of the buffer size
> >>    - change version field from u16 to u8
> >>    - remove buffer alignment check
> >>    - Separate buffer alignment vs MTU of a single buffer
> >>    - Use buffer alignment only to get next buffer address at alignment
> >>      boundary
> >>
> >> Changes in v4:
> >>    - Introduce new patch to modify rpmsg.rst documentation
> >>    - check version is always 1.
> >>    - check size field is same as size of struct virtio_rpmsg_config
> >>    - introduce alignment field
> >>    - check alignment field is power of 2
> >>    - check tx and rx buf size is aligned with alignment passed in the
> >>      structure
> >>    - check msg size is < MTU size
> >>
> >> Changes in v3:
> >>    - new patch [1/4] that renames variables with clear names.
> >>    - %s/rbufs/rx_bufs/
> >>    - %s/sbufs/tx_bufs/
> >>    - %s/last_sbuf/last_tx_buf/
> >>    - add num_rx_buf and num_tx_buf in the documentation
> >>    - change version field from u16 to u8
> >>    - introduce size field in the rpmsg_virtio_config structure
> >>    - check version field is set to any non-zero value.
> >>    - check size field is not 0.
> >>    - Remove field for private config, as not needed for now.
> >>    - add documentation of rpmsg_virtio_config structure
> >>    - Check for error when retrieving MTU size in the sample driver
> >>    - %s/mtu/MTU/
> >>
> >> Changes in v2:
> >>    - Change author
> >>    - fix commit message with better explanation
> >>    - %s/sbuf/tx_buf
> >>    - %s/rbuf/rx_buf
> >>    - %s/num_rbuf/num_rx_buf/
> >>    - %s/num_sbuf/num_tx_buf/
> >>    - %s/sbuf_size/tx_buf_size/
> >>    - %s/rbuf_size/rx_buf_size/
> >>    - fix typo
> >>    - do not use ALIGN on buf size, rely on allocator
> >>    - make err msg more explicit, %s/vdev config:/bad vdev config/
> >>    - fix license and add AMD copyrights in the header virtio_rpmsg.h
> >>    - Assign bit 1 to VIRTIO_RPMSG_F_BUFSZ feature
> >>    - use __virtio32 over __u32
> >>    - add version field to virtio rpmsg config structure
> >>    - Introduce new patch to print rpmsg mtu size in the sample rpmsg
> >> driver
> >>    - move linux/virtio_rpmsg.h to linux/rpmsg/virtio_rpmsg.h
> >>
> >>
> >> Tanmay Shah (5):
> >>    rpmsg: virtio_rpmsg_bus: rename rbufs and sbufs
> >>    rpmsg: virtio_rpmsg_bus: allow different size of tx and rx bufs
> >>    rpmsg: virtio_rpmsg_bus: get buffer size from config space
> >>    docs: rpmsg: add virtio config space details
> >>    samples: rpmsg: add MTU size info
> >>
> >>   Documentation/staging/rpmsg.rst     |  17 +++
> >>   drivers/rpmsg/virtio_rpmsg_bus.c    | 156 +++++++++++++++++++---------
> >>   include/linux/rpmsg/virtio_rpmsg.h  |  41 ++++++++
> >>   samples/rpmsg/rpmsg_client_sample.c |  20 +++-
> >>   4 files changed, 186 insertions(+), 48 deletions(-)
> >>   create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
> >>
> >>
> >> base-commit: d4d61a4b0a52e8f3cdb3e1578602850a3452ec3e
> > 
> 
