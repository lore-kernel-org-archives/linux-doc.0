Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796333;
	b=Do+Q5FoT0P/RlL+4AJxl3s5cQ08lChmRha7eA11HGN6zqeTGltFNlXEcHARbv0ZXthJe
	 7wgfe6zk2FduV7LVCUe/XopZgo44vKUT2idMV1mSQSzH7glsLuCzpvwckmUdvMGmllLQU
	 ZFk9l6mCNcF+8nfMhOoud0ID3PoRdMk/n01ASnHrz0y/Mxxdx2xCg9eoUHWWlcA/0cA0q
	 +rGgWYNyxLk/cL82KHgg4nejoaveA7LtEM29Qqud7U33rZUx1o4/mqw4Wtf5F2y7nBc1g
	 4LpOtR9vKWPIpd9GL0FiaTa6vPTkNadkTRgAnVOvFbGA2NwsSWVs92HsnuJfqlNySzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qP0oQ8pgHCHQzk/+nldvTTjF2Xe/AkvM0ngljoymRm4=;
	b=MIhq6ItivnTMfxDWsExL74EdjmABoBFL0xEmsk2qlJ5jeNia/18QwY/PH5nBOXSJ7P/7
	 XcJk4UrBQdI1S1UNEHh0AqnnlwnskoOsvDSEhLDhKeiq+DfUgmy3Nx4ysKF5yuuqIhRBC
	 1GMpvXinopi6vMz21PW+rk8mbv0OSitnXWj1x8psb0HVk+Bvi9rHYrcE0mYA8AvClm0ar
	 UWvI3U7PlX6UpoqSKihiGenu/paAsYINa2/+5urf+Nxj7JshoMQTglc8GCdewUouURME/
	 V4PBrSl1rYqKvAmsQLJ0SS4e4s9s9XWJnHQXsiQVQyCQ0iuTM6plP9aOI9LX3Oq1xYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n097wLUh;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08336606A31C
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 02:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08336606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n097wLUh
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-70bf1671c21so2696749eaf.1
        for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 18:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794796332; x=1795401132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qP0oQ8pgHCHQzk/+nldvTTjF2Xe/AkvM0ngljoymRm4=;
        b=n097wLUhxoclfA5QObXODd/JJRRKdOMko7wT9CCDpExxu+EqWIRhSBNsYYJW1UNrAo
         oNR2SX6deWfZeNa0DslMa0sMX7UtmAo4zgIRgiABWk5pgtfUOw13ijcp3BLV3Cx6zeNf
         1bUrTC2qZRH5pmqtCBMte/Th5bR9t19SgALJVXzq6Vf7+4xIxuM67fweKuwVegbjyKw8
         emkTrBKSFEk8UIjCPafZo09qflxilxW1zvRkRkKTsOe9nWg8K/mFtD/SOTvEtC638G2M
         jBcu5xCP71GlWOtRLnusPyokNC5B0dn9ZA4K8Cg9ZrEg3zxWJMvW1nrpzEpjZ7RWAlVe
         n4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796332; x=1795401132;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qP0oQ8pgHCHQzk/+nldvTTjF2Xe/AkvM0ngljoymRm4=;
        b=RNIb31LObRsfhE4YKd6McojGj34PUJs2sRXXcvwUS2xA43FBcwwJyQhIsQrzSWuzQU
         3J2zzIH5C7HonpV9zQ1rlfKhB6Xy3ROqkhfevXSUshw7EIyxAwToZDDyn8OSdr45SPcU
         EYpIwMASHMS85/lM4hfgSRC9dzy+lZhXlHoDfkKGEYH0Fb47f9z810vBbEy6TrIlP/q1
         sx2Qk4M4fE7nw2FkDh2VjXFlcLPrJ4TWB009lwkhdN1b/M4U40Ad7IuJDL39zE/Y0slJ
         /7vbvcSWaLxVdqXSwJZb5zCrao5fymiWKpdxuWWwENBWbNwH01lRHPNHIfmaeZgb5Ij/
         75Tg==
X-Forwarded-Encrypted: i=1; AL+hErG/RMo7CmvT5VOMLpz4C8Ym1a5cbcPEBhySqOeTXUMguEy7zJP3HagfA1RiT9bovgMzDAo+X8FUbds=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vQhAKPuMaWqqHkkokpgx4l20avaFhmMOmI/pohdd7aQpVqgjs
	Qs2I6pY9Ex/ZxtLgIKk9PhBmA8ln0ahzT7lIuDtjYLkLW9k3U54kDUeUszXS5ZFK
X-Gm-Gg: AYBFou06EfMkRapS25i6LmkPT25PPpI2QFmnFz/Y8YygUgi8n51yRc8PiNQNXVtpH2P
	XyoENO9STaIHTgfT2JF10fpRk3zYky+UOpmXlMJTourOOrDxthK40ufoD4E04WwgwTwz73IZFyC
	jd1BSVcrEUR5/y/56byNPOiM61a9a/LM6Q76eKKC1ccnQl5BpYyji3IfrXwZb/l4WgT1ysBKI8A
	R/DbkZaNidosqKUarJF7zEcEStfcF+cnfBS65HVTe9P8fChbcJOOnyZtuPlw+efkj6mIcNSIunk
	q6bv4pUI/GorMzMjuqrP5+Gf6lPrGac+c2NXeOvZ2y4BTiK1LEthMJDJI0/M6B3PcUeiRKdn7tK
	6ilBgk190hlDuS2Pn1S1byMi0MTUrr+SpiEPPAhL0G/djtM8eq0i3BGg6L47QTQmyfJjmKmjX8T
	gJZwW/n0kHx0qPoCvdht8uCEOGy5s8fFgR1RfoW9MyUApeFuhAatvw9zRA4SI4A5ddMYplYhIAD
	xirR9E7Mlz6VVnxp02t7W2+vS9dCE/6PrvhTRUSxtQhk/Br/VmfWVMmMfRFwOhOgvF24bevjXF3
	Lln+3aDefvFHfCAGRNfpsevLZDXpcWaefr9phaYtjKJb4UBVWxwxVXyuTuoJ99ga7mONvZRgO3u
	xTbRhtHbCKyfYkJ1ZwMyT3lwhD0hgY4v9qg==
X-Received: by 2002:a05:6820:1c83:b0:71a:ea6a:4f65 with SMTP id 006d021491bc7-71aea6a57c6mr2168123eaf.23.1794796331802;
        Sun, 15 Nov 2026 18:32:11 -0800 (PST)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm1743225a34.13.2026.11.15.18.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 18:32:10 -0800 (PST)
Date: Sun, 15 Nov 2026 20:32:02 -0600
From: Ming Lei <tom.leiming@gmail.com>
To: Qiliang Yuan <qiliang.yuan@linux.dev>
Cc: "Martin K. Petersen" <mkp@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org,
	Mike Christie <michael.christie@oracle.com>,
	Bodo Stroesser <bostroesser@gmail.com>
Subject: Re: [PATCH RFC 00/18] scsi: target: Add target_core_uring, an
 io_uring based user backstore
Message-ID: <avprIhtn1TuYLX1b@fedora-laptop>
References: <20261115-feat-target-core-uring-v1-0-28cdc137eac6@linux.dev>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115-feat-target-core-uring-v1-0-28cdc137eac6@linux.dev>

On Sun, Nov 15, 2026 at 07:17:53PM -0500, Qiliang Yuan wrote:
> TCM/USER is how a userspace process serves a LIO device, for instance
> to export distributed storage over iSCSI or vhost-scsi. All commands of
> a device go through one command ring under one mutex, the data of each
> command is copied into and out of a shared data area, and the server
> has to parse every SCSI CDB itself.
> 
> This series adds target_core_uring, a second user backstore next to
> TCM/USER, built the way ublk is:
> 
> - The kernel emulates the SCSI commands. The server only sees reads,
>   writes, flushes, UNMAP and WRITE SAME as an operation, an offset and a
>   length.
> - A device has several queues. Each queue is served through io_uring
>   commands on its own ring, with no lock shared between queues.
> - Data is copied once, with pread()/pwrite() on the character device, or
>   not at all when the server registers the pages of a command as an
>   io_uring fixed buffer.

This is ublk's uapi re-implemented inside LIO: FETCH/COMMIT_AND_FETCH
per tag, pread()/pwrite() with (qid, tag) in the offset, and buffer
registration via io_buffer_register_bvec(). It starts without what
ublk added afterwards (queue affinity, recovery, auto buffer
registration, batching), and the sashiko reviews already found the
same abort and lifetime races ublk fixed years ago.

Follows two alternatives, especially with zero kernel change:

1) If LIO is required (vhost-scsi, FC, SRP, iSER), serve the device
with ublk and export it via target_core_iblock. Same per-queue
io_uring, same user copy and zero copy path, no new uapi. Please
benchmark that configuration, with UBLK_F_USER_COPY and with
UBLK_F_AUTO_BUF_REG, same 32 queues and threads.

2) If the goal is iSCSI for userspace storage, keep the kernel out of
the data path entirely. A write here still goes NIC -> iscsit -> LIO
-> uring_cmd -> pread() -> storage client, and a distributed storage
client needs the data in its own memory anyway, so the zero copy path
only helps file and block backends, which iblock and fileio already
cover.

A userspace iSCSI target on io_uring receives straight into the server's
buffer, with one copy fewer and no new kernel ABI. ioutgt

		https://github.com/io-target/ioutgt

is that design: one ring per queue thread for socket and backend I/O, lock-free
data path, NVMe/TCP and NVMe/RDMA today, iSCSI on the roadmap. It already beats
the kernel target by a wide margin: about 2x nvmet on 4k NVMe/TCP random read
and write, and 2x on 64k over both TCP and RDMA, on 100GbE. Adding iSCSI
there is a bounded userspace project.
  
> Patches 1-4 create the device, its queues and the character device.
> Patches 5-8 pass reads and writes to the server. Patches 9-11 handle a
> server that exits or hangs, and aborts. Patches 12-14 add flush, UNMAP
> and WRITE SAME, patch 15 adds fixed buffers. Patches 16-18 add a small
> server, a selftest and the documentation.
> 
> Not covered yet: protection information, and a way for existing
> tcmu-runner handlers to move over without changes, as they implement
> SCSI rather than block commands.
> 
> Exporting a 2 GiB device through tcm_loop to fio (io_uring, direct I/O,
> iodepth 32 for 4k and 8 for 1M, 6 seconds per job) on a 32 CPU VM, with
> TCM/USER and a single-threaded handler, then with this series, 32 queues
> and one server thread per queue. Both servers keep the data in memory.

32 threads against one, over tcm_loop with data in memory, measures
only the hand-off. Please run a real fabric and explain the -13%
single job result.



Thanks,
Ming
