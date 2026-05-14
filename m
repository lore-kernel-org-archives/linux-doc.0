Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB99630C371
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 02:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778725712; cv=none; b=Hfs+4Qbprgq2EP5uX7ECyoME3kcUN5/vn20WO5OpBNPHEBBetHheBig+TLHuiQNZc0vNJ2kmWWm6e79Ngh3aInHiA5d1oB7ziajiGfO5Wm1MluatiySvnavGajK4x+L50Vii1oigMak09kq4o1XAmH/2D5wsVjtXkB06eh/RZHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778725712; c=relaxed/simple;
	bh=oaxgpoSbY65896j0Ju4jgMezNeznny82DVYv/Yi/2Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLtIEtnRbhCPanWydkrMxsPWOdx0BHA3DZEf9F/ffDfuWnVzt6piZl+96E+E/HGiug6/57au9pRD8hrLpUOneuKkHV2iKZdRedcDpjaQy34JdE4IoxRzAmOWek3vv9N8hjaJgZeZ6mCAVJ372Fk6u4joj9AAH7CLJUDUBZVX2Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjnl5cjV; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjnl5cjV"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-651c366f7efso8365835d50.1
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 19:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778725710; x=1779330510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mxfGgciuIl8ecIFy9+5zcD49dfpTzAB0PVcZJYXaajU=;
        b=fjnl5cjVVcoKnjVGGfmK/DNONvc0XgYuYhmB5ci7Ettt/CfRsbuO5BHrq6DMSp2Nsr
         DoLzh1Y4AmVVFPN2/r/nvLFmeRPbCGbUht6a/fRJLcZBVwrUdui9qrHQSK25QcrFlyzO
         qmFRzSKIf5H2QR2rW1he8KumP475SN3HL4ajJOmlivup1N4u4+RbQe30QQvgAz5Vfnod
         d+1SDq7ueGLmSkAwjHZGgEwk4ENZ5r0Sl4kp9HCh7MnmuOFilHnrUml+lsA6IE9bhJl0
         EhMxcJ3i9nCiDKnOTPNHqVIojk3we7X++fousEat7rt+2FaL9sPL5TRRMzM+y4IPcNe6
         aFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778725710; x=1779330510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxfGgciuIl8ecIFy9+5zcD49dfpTzAB0PVcZJYXaajU=;
        b=ELBUkXEVLPkbHmBS0szhBRWwGei1xHkT/3PyCNBWw1yY+b72jFsQ7gOFHbQ8hGGfCa
         WxIJHB/KD2uMkUEsU4yEqc6fCKiUhCENuZPsfOyn2QT1+R/Q/MQ5QlBkkl6hwn0EAQez
         re1pMKR6wKmr1Z4WX2I3dWNmWaoWVXImhKHVhDW3CdoNu9qa9MqCj1QxBamN3qxRkz7L
         ShFNMsLrOskYvVr9n2srBVGwPBRaUYdHoJWdq1jzf1YPvWtJDpGZr8E9NpqzzTQylke7
         nRxW9YiyksY8G3T65Zo9YDJ2Bk/icAs2Lc7onHvxBtmYLrxGWs1Jm5zLz6mU9sX0tBAK
         0ETQ==
X-Forwarded-Encrypted: i=1; AFNElJ+L78Ca+dLsgK8QDwq1Wfn09zs2G1OAgxqn1rkGu1c+b7SMrZV2j2CORX+2Rc0PKmEplj0zhBg7wcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJH7Yo32q6Q8gf/x9nuHXEA6qLRs9iIm2guGAVcdXz4Pp82+BP
	vrvm5rAehq3I6ak6ABLGtQe3bxYNbwOZzD1kBzeUInHq8pTSj20unlVJ
X-Gm-Gg: Acq92OEKnY9ZPrhcnvyBeWd/AdQOQPQBi49Ln80e8LoB7Tt3K1agDo0EwNMgVX2Ok9n
	gDN8FfaY0BM+/gUkGOtTEMwJoseKUYdW1SlKIJD/mPyLHx4DXBOMMMf3v6zYjDXsUbX/hONNUtn
	4IqJ0jRHINue2jwc0Cq3W5LRgL4Ot+gsRLdR5tGA4SBWA90HLQ9j8vCL53t2js62D/zYc/wnw70
	QhN0ML0toK/VsI/iSfiO4vN00t3Q6LIswsG0h08C5Uld5R+EaKrHoRczFc7ptreCHc9HdfeE8+o
	M3BpDnvaKN4gLWIDUUSQBGvgU0te5/9nW8VnCKKPDZmLIGOmdrDX3YpjqxZuWurKYXZexiGcpwh
	4ibiPHvg4EoNslhzLOjzQ4d42pkNkmh8jhZAXB2RuXnvAgTsA4K+yYZ7OO9h3OBCs9sFO8JV3Rg
	OQrpQkoNpdnFUkjMgvz3JpcgvBQGTGeLy2VCiCKvs57AXVrSQ=
X-Received: by 2002:a05:690e:118a:b0:658:a18:cdf0 with SMTP id 956f58d0204a3-65df625951amr6137491d50.29.1778725709828;
        Wed, 13 May 2026 19:28:29 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:f806:29::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e0db0aa51sm438759d50.12.2026.05.13.19.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 19:28:29 -0700 (PDT)
Date: Wed, 13 May 2026 19:28:23 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Joshua Washington <joshwash@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com,
	Daniel Borkmann <daniel@iogearbox.net>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Shuah Khan <shuah@kernel.org>, dw@davidwei.uk, sdf.kernel@gmail.com,
	mohsin.bashr@gmail.com, willemb@google.com, jiang.kun2@zte.com.cn,
	xu.xin16@zte.com.cn, wang.yaxin@zte.com.cn, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Stanislav Fomichev <sdf@fomichev.me>,
	Mina Almasry <almasrymina@google.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v4 6/8] selftests: drv-net: refactor devmem
 command builders into lib module
Message-ID: <agUzR3O35Rx4RHnu@devvm29614.prn0.facebook.com>
References: <20260511-tcp-dm-netkit-v4-0-841b78b99d74@meta.com>
 <20260511-tcp-dm-netkit-v4-6-841b78b99d74@meta.com>
 <20260513192133.60a82598@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513192133.60a82598@kernel.org>

On Wed, May 13, 2026 at 07:21:33PM -0700, Jakub Kicinski wrote:
> On Mon, 11 May 2026 18:18:00 -0700 Bobby Eshleman wrote:
> >  tools/testing/selftests/drivers/net/hw/devmem.py   |  77 ++------
> >  .../selftests/drivers/net/hw/lib/py/devmem.py      | 218 +++++++++++++++++++++
> 
> If the reuse is in the same dir I think you can create
> 
> tools/testing/selftests/drivers/net/hw/devmem_lib.py
> 
> and import:
> 
> from devmem_lib import bla
> 
> I _think_ that should "just work" ?
> 
> The lib/ is meant for things shared between targets.

I will give that a try.

> 
> Also I think you missed adding the new file to Makefiles ?
> It needs to be under TEST_FILES for building tarballs

Ah okay, I wasn't sure if the already existing `TEST_INCLUDES :=
$(wildcard lib/py/*.py ../lib/py/*.py)` was sufficient or not. Will use
TEST_FILES with the devmem_lib approach above next rev.

Thanks,
Bobby
