Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794531700;
	b=nUr94jr+7nf84jCrsJwyplQp2LkP5h73Bb2Tr93e7lwtcdCL+ZMwSqc3vpq2Qu0+/3By
	 RVXMHTUOlQuRaqhxZnXzmEDAtWYrfxLoArDVOQy1u/rEoJwHB19ytrfXKoFpOpae5cbu8
	 8fxetbIRL7TNSC8vmSj/W6IPtq9O0fsBrbVuIDIgFkvRIYI8aIZs4NKj/vw6hpemwcK4E
	 tbJCdv5Atq9+FuVvHzms9//EdNyRQHyk88WzXYMbQjq0hK7BZCNQ5YhENU1k4igTN1KMX
	 LgHmLqA7TNHi9falroQtyp06bSa5r0WQzD5aZCEiRcakx/vLVpklqJDlyTum3H8Soaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xsqNy8x4lmXAXvHwF9gkwZoG25xYnfN0MsYpVbWeuyQ=;
	b=bRNBK4lEhNIb0rT5fa6D5ETXgPnVAFIGrJLwnH5tddpPxwbSR0YOUmLlBYTpBdy9F7ye
	 iZuViM2n8OqGRbNJBsi6WiycF+GqpybkbIscnLB6UjTSN635paqUtPwB4TDfl5PujbfWI
	 fsOm49JSndRuiXiBN8E4MFS/yuZ+6RRH5jDHGJkWrbItgy7aNKeL6BkJ4ka/A9SEsPSUj
	 dY2o3Wy0quXO6GLSguUVfCNphRT9qW3mgiPPa5JfFU3DqWm0Ol6CF8LKYmIl5fDtly+2j
	 MRGjy/QTGz4WZ6dPVLKarYK1GqrP4HcM6WgV4fcWs7k8JUu/9go8o3/OyS8eb0QOqvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=joelfernandes.org;
	spf=pass smtp.mailfrom=joelfernandes.org;
	dkim=pass header.d=joelfernandes.org header.i=@joelfernandes.org header.a=rsa-sha256 header.s=google header.b=G1jbsG+S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B65606A32A
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 01:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07B65606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.a=rsa-sha256 header.s=google header.b=G1jbsG+S
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so1943715e9.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 17:01:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794531698; cv=none;
        d=google.com; s=arc-20260327;
        b=XvBi0o5qld7I55eVU4q66V6xsEEIU01dPMCUCEIrrbTMskr5qRnlgcvKb1SeHemLOI
         z12pAHAgQ3Iu9OEkmPlWYs2Mte/TQvceZY+dpJD7XsVCUzELQaAetED3zaTqMgB9+aey
         wwetVzaRog3ebIzXv7BqBGxnuPd7RMSM7kHbcPAyj/a6ykBpeVTFl6wyQJjLSTcGs8m2
         D35gAMhkbKm25gHTEB6UeVC6JwuIdlXPhZV3A3GKBWqbZtxgiQ7x5lvD/fEm5uZKwATS
         DYumzxJ5LbKcVL44mrNnMdOpXni9Lug9uuAxW8RqdXgaYw3xBlD4ci3oXOGhfTvPOZ1L
         lLUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xsqNy8x4lmXAXvHwF9gkwZoG25xYnfN0MsYpVbWeuyQ=;
        fh=jhh6ZapplbdsPCVKRhoEHt0tJaVbj2buXR/CK0tP0EA=;
        b=jQ9NwJhuULDTsWSrm0FDgv7K1ZVwvnXWmQyBRCPMbQ3xAXvLZscaVZXPD3xA+ykyBG
         7V+l4fFXZUcYICuiIyxIZGN7yAOIdojNbBOI8fNzWIInArvccnL3kgTGzNk35CmX0SXs
         EMBMfMbIbltU+FmlFRA7W1QQc0BSBj3KLRmvqEln+T/iTmWgprdyfdIoIYPLolv1lbvZ
         oGcHmEwlEk8/+XMw4fj0hJmjecO07DYMDRE+flc0mLreVCSJ5zjaOkUmxVpWcLa3s9K/
         3ZWAPRnwzH87Eq88PTXIHE/J6EhoWeOgSEbBujND+L5WsWE2IlXsyn3xiBJY3VYe7IFj
         GhXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1794531698; x=1795136498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xsqNy8x4lmXAXvHwF9gkwZoG25xYnfN0MsYpVbWeuyQ=;
        b=G1jbsG+SSau2XzDeW1OBYgcZTEKbYsSnIFjCz5jzxju2YOgwgfGuinOztdcmDgtqWf
         gs2+QeCPNvtJ/fn1ygL0g7bEy34oR7Y0N3LEL4YlJ9fDk3GdFupL6jpH7jf55PP3vmfg
         a2MC+9Pbb3enm3e5qIZT7H9J+PCKaYqIYCk1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794531698; x=1795136498;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xsqNy8x4lmXAXvHwF9gkwZoG25xYnfN0MsYpVbWeuyQ=;
        b=rdp+94DT48eLYre7v9P8EVbF7bt5V04iMXjZlBBWsEWE4stXYyOmFzFxfLjpEHQ9tS
         nLFHWwn0ou99/Yao7TGxMtxNmzOkkvvCCEJy5aAd81eDrIiNEcE1LCo4W2Ir5c8CdNLm
         Tf5NxOif/gq7iImZawJJT1EEBd+HIbZmlWkNVv03PTotsTOOyD747FuP4QbbFsMz/i45
         E/B37sQfJfDD9SF1jO1KHxLLc+piM5Gmb/WFgLmPrryVMdWi6v7LsJyyK35OZKFDeBFM
         WV/0aMqQP5DIdrf3EASJW4rJAUtNjdiQwHrUKce3YPS7pY77+JrdwRP4sWKbxR63CqcX
         +l0g==
X-Forwarded-Encrypted: i=1; AL+hErGZo4L8VdO2phD2zqLru5CYFhRnfEwDZ7Yn75cj7aQ4c2Uy1zsL+KogKSmjPiRxj2fke4GSbgP7RFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wfqKvVX0lhq/J1cpH51psZAyKRhH/ZpCBGnUbvXga58DJkWrE
	0lDFmZrVNqiccgWRaVuk8qaN+hYT9W40JBU4qsNalDs+PtGhl/cXAZASBaidSXmfIMa5+PPg5mu
	zXpVu7tUHLfGybpc59uKIzV6l/mxUwj8B3il0ENcPIA==
X-Gm-Gg: AYBFou33Y3jNAhOAtwf2dfx6VBw/q52mhU1E6MHYi8bKHLidSt+9mcgz3yBcnzlEnOG
	IM/AU6DZEvXKeVWg5roGgS9q+lNcuA9RpAc1BXvGNJgyi+mu7Fvf6RHVgWvEYGWYIlW0WJaesAW
	C4A3dOos8OgHvGzHzhaH5tDMt9JotUb6HHwuAygMoK/dke+eYHt5n+NAWAWx37yZL3y0DRUGjFG
	HoUk0+yKz2Q0JCeDucEsSSzCWpsKbofiMyO4SI5z30PryxU8scalvcuvhye/mevU5VrscbgkvuM
	TNTridVISvvqFF/ZmOUbfl2rS/iiD6NxvvM9Vekiy7uiWz/o7AHqu+N/cX9HIPzcFKCQrm0zBCz
	RnUyO+aZt/af0ciOFluQsxG91IhfZ7WItv9a6joodQ4DqbDw86OT0vYminQs=
X-Received: by 2002:a05:600c:8b8c:b0:4a2:1197:1de0 with SMTP id
 5b1f17b1804b1-4bb55a7a460mr17515855e9.19.1794531698338; Thu, 12 Nov 2026
 17:01:38 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113004946.2758197-1-jfern@kernel.org> <20261113004946.2758197-5-jfern@kernel.org>
In-Reply-To: <20261113004946.2758197-5-jfern@kernel.org>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Thu, 12 Nov 2026 20:01:25 -0500
X-Gm-Features: AclHuK-BlMNbouTRIZA68HB056zVMIxCfaWWRZW7PBno_ghygL1wLUmiCANRO7s
Message-ID: <CAEXW_YTY1rjYH8FwvLvc1JbOQYDuXTP7BEE0a6eoRfu+-ZC6-g@mail.gmail.com>
Subject: Re: [PATCH for-v7.5 4/5] rcu-tasks: Use pr_debug() for callback
 contend/collapse messages
To: Joel Fernandes <jfern@kernel.org>
Cc: linux-kernel@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun@kernel.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, rcu@vger.kernel.org, 
	Song Liu <song@kernel.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 7:49=E2=80=AFPM Joel Fernandes <jfern@kernel.org> w=
rote:
>
> From: Song Liu <song@kernel.org>
>
> Commit 5de907d24919 ("rcu-tasks: Disable callback contend/collapse
> messages by default") added the rcupdate.rcu_task_collapse_debug module
> parameter to gate the three pr_info() messages that report RCU Tasks
> switching between CPU-0 and per-CPU callback queuing.
>
> The kernel already has a mechanism for debug-only messages that are off
> by default: pr_debug().  Use pr_debug() for these messages, and remove
> the rcu_task_collapse_debug module parameter, its documentation, and
> its boot-time announcement.
>
> The messages stay off by default.  On CONFIG_DYNAMIC_DEBUG=3Dy kernels,
> they can be enabled at boot with:
>
>   dyndbg=3D"file kernel/rcu/tasks.h +p"
>
> or at runtime with:
>
>   echo 'file kernel/rcu/tasks.h +p' > /proc/dynamic_debug/control
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Song Liu <song@kernel.org>
> Signed-off-by: Joel Fernandes <jfern@kernel.org>

Btw, even though I included this in the 'for-7.5', I am planning to
send it for 7.4-rc as we discussed, so please ignore it in this set.

thanks,

Joel Fernandes
