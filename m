Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701849;
	b=A8tt3YhTquewyao3c286A9FMcqyFIzuYoAZi/P6A9vtmpGNoDyXlF9XPNDTwB8Jl6TwB
	 WvQreltkdMCk6cWXKTlJOe33rnhgYnCpTZl8ySzL/jtftB+9lVww1RhRP1senLq9ehG3p
	 UngAbEAq3oPm16gqjQdGcQXSVAQ+VcWHmEAxwD5sr+RgZR4uc8Ge1OgMGus60PneXUStg
	 H6/wWvnwYA+prthXxXYvFHojR6gvnkT4jMd0udjtVnZGNKsbR7643l0d7bx+do4B33Tr2
	 kdb0mI+2+nX7JDcqtXU5GmPL80pGS1+4QNucrPixMyI64zbbP4rZDFM1FV56ifbf/1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rUKedcpVkiNEfx49bKB2qoAIuRwcwKKFeuE1z3r00s0=;
	b=LngCDvY8knoXrJDK9EFjgay9Fc/qlT/1FGM/O+u8mDEbMLbqShbINJiquNtg1Ed+sr4p
	 pmbEhUWF0qR1WoT3l97Jhej1obqOhcyB8xNERT3OpUp5FpK346dVAO6ijYF0CdMlSC+IS
	 U+gqHWd7OrRttHUwaCvGQQJ4Bcfu/je9MgoS2TjIn4HbjWaG/w7Kxu1b0cPdTkd+2OmMa
	 cDXdGD1/DliM9k5K2CNwNViwAZ0bpgLe410BFsBJYzyBonMc7oGkluKMgz6F5QGnCr3fK
	 3QE8+Lx4C+v1TMC1B2jlgzU2I71ka6U3rk9DmckHP8o+qZ3iZtMUyqrfvMxKpVOVBgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b="lGHJ2/7A";
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063B3606A33B
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 10:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 063B3606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=lGHJ2/7A
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bfc346401aso2871451e87.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 02:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793701846; x=1794306646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rUKedcpVkiNEfx49bKB2qoAIuRwcwKKFeuE1z3r00s0=;
        b=lGHJ2/7A+c8PAoafyItHPUKePCeXbliM9fGrD5xJcz3JpBqpvmtWUxQjud4v3HS62O
         o56E7Kb9SRzktK6NhMfa+6ZtWZSbmJt5LWEKR7WrQ7rUzzjWF1A7JanQ/LBl9m+BcH5b
         Hzj2p5p+gNiDVEYaUnNESbOXtEC6L+gDN07LWsuh2VkoM20HAjPss5X+ikBTBh7+8MSb
         fRowcjM7MMC/xob+HTP4ofXA99I7jUj/tlGctRB3e4cl8CR6CwYX4+wvJ9ZFiDNJ6clq
         hOUOuJC6Bn7TKlqDLYFX4IfP9cuODLqnkxgxEbNnyzV5lAWIst7n/Yu3jEY4/fh8qwN6
         4tdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701846; x=1794306646;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUKedcpVkiNEfx49bKB2qoAIuRwcwKKFeuE1z3r00s0=;
        b=la8OZ1e3IWPjaaGWDof3ChKVUyoc1D8v6BwyvEJWZq/N76x1lZeBfpJmTj0AhnTZcE
         dwhhO49/V6uxQmhH8nQzzaOLfwDI0NJNHxakvLKxB98NpA1z68iu2jWv5Jyx3BbyYBAD
         +Hc+qI91TJSfBP3EoWkg69HGCQTuqwWJJKoeUT44XkMwfVAStwXJd39QFhLJM9moRLls
         IVD7Gx6dphHVyAgNK9ksRyXWvnhsBWpJIty8HB3kdn2jeMVXyMyv/offQ5fUIjO77ieW
         RkXpsSH5hNAVAfIgUXA/zzmFl7saxKFsotCjIgyW6YIyzfsw4qLXI6ByXkbnVLXLkr0y
         Qg6Q==
X-Forwarded-Encrypted: i=1; AKwUvBz4cvSaPuPnMB8z9k4zfJ9Dgh9VbNJNtbAgYYK3SJGchXtWqwYRBWcUfOQZSm0/CBPMv7zD1B/zpyc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eQe0cB964LdjcYswz9GGaZIK0RSu6kr4FMB2YrRAOzz7Ty+Eb
	h0smOtKOkr5Hmd/6pYFJ/MFDQ4bRZRRnQjo/5o0evpwl1YXhjPGdZi9jgVbbVPtiJJU=
X-Gm-Gg: AYBFou0GFhEsUKuKs8aZeXSL3fgordypy1Y1eceOs/zjowH0/farbrYk/E5dfCRWLph
	u716D3SES2R0cYAeuDAyp+N/pmN9EtI+igNh2miQjME/l27sOM0icyoyhq+HTdn4sjAyvjxQkAU
	1IxpE/Qlq4uK6/JdKpmc8iodHUe6aUSpquABbW+XMLHuqDuFDLPl0b94r4b05KDcKB2TsLDFmf7
	gykxIydMUDaUaypQce5KhSSMfNZVT65dFvc0nkPc7vDC+T0Y/iuxSKyapdee/+Ez83LcTw5OanQ
	RyXDLLHRaFRZh1omLVKd3t5yC11Ou5VRgIG6LrJFMO3TyB9Iz2hoCCioGqOkY/nSDYs6dTRuWNw
	sJCCO2Frdrux/cWqfiIljz2vmppIfLVWhwgb3SUieEy2fZvEYF7K2+B05K5D5t1QZdXJDxp5oSV
	XPdYdQK3ry13tyXkThQIuHxiukV6WzzvdBADBV6r7Mpk2ju9OhGWDEEwGD29yMvZ8mDEArpofKG
	x5e8+MxIGWG+NRaLROixS007ROUbvMsa1kVaZSM2bAMZFWncbwKqT/oGZc3s6Ixyjtw5OI6eIUC
	qJipfZqm9IUviDef3X1OvauRgVqZjzrMaqRe
X-Received: by 2002:a05:6512:3da9:b0:5be:41a1:d2c3 with SMTP id 2adb3069b0e04-5bfd958d569mr4093510e87.49.1793701845873;
        Tue, 03 Nov 2026 02:30:45 -0800 (PST)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074aad9sm2132213e87.75.2026.11.03.02.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:30:45 -0800 (PST)
Date: Tue, 3 Nov 2026 11:30:39 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 04/20] Documentation: ctlv: Add userspace ABI
Message-ID: <aum3xbO4lbiBWUtL@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-5-jiri@resnulli.us>
 <auOWFzX5N7HBbcH3@MjU3Nj>
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
In-Reply-To: <auOWFzX5N7HBbcH3@MjU3Nj>

Thu, Oct 29, 2026 at 07:53:11PM +0100, sergii.dmytruk@3mdeb.com wrote:
>On Thu, Oct 15, 2026 at 04:50:37PM +0200, Jiri Pirko wrote:
>> From: Jiri Pirko <jiri@nvidia.com>
>>
>> Describe the CTLV transport, discovery, wire format and userspace
>> compatibility rules.
>>
>> Assisted-by: Cursor: GPT-5.6 Sol
>> Assisted-by: Cursor: Claude Opus 5.5
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>> ---
>>  Documentation/userspace-api/ctlv.rst  | 507 ++++++++++++++++++++++++++
>>  Documentation/userspace-api/index.rst |   1 +
>>  MAINTAINERS                           |   1 +
>>  3 files changed, 509 insertions(+)
>>  create mode 100644 Documentation/userspace-api/ctlv.rst
>>
>> diff --git a/Documentation/userspace-api/ctlv.rst b/Documentation/userspace-api/ctlv.rst
>> new file mode 100644
>> index 000000000000..5ebca3d4d94a
>> --- /dev/null
>> +++ b/Documentation/userspace-api/ctlv.rst
>
>[...]
>
>> +Errors
>> +------
>> +
>> +A failed operation returns a negative errno. Where the failure is a rule the
>> +message broke and the caller offered a reply buffer, CTLV also writes
>> +error information there in TLV form: a ``validation-reason`` value, a
>> +human-readable message, the offset of the offending attribute, the offset of
>> +the nest it was in, the ID of a missing attribute, and for a stale query the
>> +expected and the current generation. A buffer too small leaves it unwritten;
>> +the errno is authoritative either way.
>> +
>> +What the transport answers with, as against a family's own callback:
>
>It seems like this mixes results of several syscalls (e.g., `open()` and
>`ioctl()`).  Does it?

Right, will split.


>
>> +
>> +``ENOTTY``
>> +    Not ``CTLV_IOC_OP_EXEC``; this transport has one ioctl.
>> +
>> +``EINVAL``
>> +    A reserved field was not zero, ``op_id`` was zero, ``generation`` or
>> +    ``cursor`` was set on something that is not a query, or the message broke
>> +    a rule of the format or of the schema.
>> +
>> +``EFAULT``
>> +    The structure, the request or the reply was not accessible.
>> +
>> +``EOPNOTSUPP``
>> +    The device does not publish the operation, publishes it but has it
>> +    disabled, or the operation is an event, which is read rather than executed.
>> +
>> +``EACCES``
>> +    The fd lacks the operation's declared authority, or an ``O_WRONLY`` open
>> +    was attempted.
>> +
>> +``EMSGSIZE``
>> +    ``reply_len`` is smaller than the smallest fragment the operation can
>> +    answer with. Nothing was executed.
>> +
>> +``ESTALE``
>> +    A continuation whose ``generation`` no longer matches. Start the query
>> +    again.
>> +
>> +``ENODEV``
>> +    The device was unregistered. Descriptors stay open and every operation on
>> +    them fails this way.
>> +
>> +``EBADF``, ``EIO``
>> +    A blob descriptor named something that is not a file, or the file refused
>> +    the transfer.
>> +
>> +``ENOMEM``
>> +    The kernel could not allocate what the operation needed.
>> +
>> +``read()`` answers ``EAGAIN`` when no record is queued on a non-blocking
>> +description, ``EINTR`` when a blocking read was interrupted, ``EMSGSIZE`` when
>> +the buffer cannot hold the record at the head of the queue, and ``ENODEV``
>> +once a removed device's queue has been drained.
>
>[...]
