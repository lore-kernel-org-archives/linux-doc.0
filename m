Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6DB5172C3
	for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 17:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789752107; cv=none; b=aVBxeUVoi946Y3JE/exl8JxRxJA9IZ0l4k80/g5XvLMmRO8V7PdCrIJKk4RRnARGO3WIRHGP3A2oHfrvTrU4zERzONlzB+K1FLeU/2eWlnjG61nav7B6yNooPmwtnbVOmASNZEr6eaNXv7XTE7DPEDrBT1YCmL1XKlAXe8N4B/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789752107; c=relaxed/simple;
	bh=de5x0Zxo6F6d2MB0yVScP1sFcZZJFeuVMt4yQvyoVlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eOu83QhXmesf0IGkEyFPPKZ/aWvvvm4DSNY888oUrqNL27sfkEBNRwoAup1sYFtfY/Gh9um/430MsQCeKQQPHlhA01eumGqZqoXlMNXG1HghEsguONAQEODdleB4YwcKAywHyJVTHcWCFS+5ueOoTbXPIgA5HYJHx7Zrs1DswME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com; spf=pass smtp.mailfrom=hammerspace.com; dkim=pass (2048-bit key) header.d=hammerspace.com header.i=@hammerspace.com header.b=aLVCpAYL; arc=none smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammerspace.com header.i=@hammerspace.com header.b="aLVCpAYL"
Received: by mail-oo2-f40.google.com with SMTP id 006d021491bc7-6b1ae6f5fc5so494595eaf.0
        for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 10:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammerspace.com; s=google; t=1789752099; x=1790356899; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BBKlhw0dOEOei2lTcRYxlQw5MM/EKQhWFk5pNENBOIA=;
        b=aLVCpAYLsiWMtfVrSXcyzAKiRQIZD8WXF3wSqmprCpJtpl70Entfq7wa2yHy4+K6Uy
         tGrOa4LLvUp5X9YtZz8bhWCm6RF+LxSfIr6/+9FCWttMd10LbpJhMtuxIg1VvLmeRfcX
         WIz3tXF49p0uraQhpq5jfZhBhrOyAS13e7LmEmzTmq7OVDf79k90oQADr3CvVCWKUJQr
         pobHkxMoXRqWoGl3yEF7Huk+wTawViIXeRoFHryYGQdLpQgyQcraGu+oRg1wHVo30aB5
         vqy35MNNRxnLbRhTP+uZTRjmFly1sUTn1JbcyDYkqTH9E0wSRcJU3kTUcvRk9QqrKQqD
         iiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789752099; x=1790356899;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BBKlhw0dOEOei2lTcRYxlQw5MM/EKQhWFk5pNENBOIA=;
        b=oIdoEaOJ7EaGK7R1pMXgYLpoY8W1mSMMTYbd/brXPBp2maSAUPO2O7kXUo0/Aurpvh
         GgS6E1G4lUYxycDXMnQik/uIq41f1l7/D52Pe5tbU6Z451wu5PtGwqEU2sljjtU6raYY
         NqheD1E9riZMzoP+KffF6HBEfJLjfGoB75Wp3AgnywrN5KVjkHBmrzOMLNLn6mFLufW5
         XH4UE3TMzlubhQN47WBo0W9If+5OYINU3h5/hI4yHXrTJU5dI1jnSoWb29wUQ2cN7dhp
         pCjM1EsxsLeyOZDHHoGXY09smHscHmQzUUK+I0qkAcPYQj5cIRffXAkZPdhnXjEYUWwA
         1Egg==
X-Forwarded-Encrypted: i=1; AKwUvBwyBoMBlt/pJNJLH1bVSMTXzt1y29J3EXBqSXRzHsRT7rlURl08kp7AvOI6MqzKMldEFPmkbIY3M0M=@vger.kernel.org
X-Gm-Message-State: AFuF++kI73DvxMcwMsAu1DrLIKu24vXCxY998duK7YhMW6/0n4WrJ80G
	p4mvafF7QExPVDFaQtY0RsNAK0QgoQJQtwOr1bZsRQEFHc7oBi6PssyezEIhi+W7SSA=
X-Gm-Gg: AYBFou2A8ny28FBS07GH+hv4ObLPMFHKQ/kNGz6GT4pvj3lzDNX53OHeaSnR1dAGte1
	WPUUOyciuDUIvfdXE5todv6FNbh2z7S43PKEq+KpeRAvGVenYectovA5QL0+R9bHciluE6ArOZL
	JT1uvOimlSj3v5FYHp0jrnyVGrQZ9jRuuXBBQdAMhj6BXbmz4ec/1PJa3bisYJ+Wf03WgJzfW+/
	qx3cLzlt37aLAbi4GiTZnU2AD8bOIerA0L4rlL8AoVC5+SkgYbeI3Tol5Xs98dp41cuKQXpRhQx
	GNurnJLBbDYLdQghnfdNn6w4Qip8ERfPMWqh2CKGE1+th+SXSSzVLQ2kztwD9lycZEwXfmYyqNO
	QFYNHxOod2opkpm63RKIS6DSrcdizon6tIF/Gfl7HI0WwpYh/EVngO5vDvyDmo6b+m1r0S+GHm3
	PjfovAMzqQ2lzApO38/uUUCGWpY7J7wKWfXQs0jHa1QCH7dQIdPKkSj315bJihN9G+2bpl5NI7t
	OQaw3Tq/7JVplpkcDo=
X-Received: by 2002:a05:6820:a284:20b0:6cd:3fdb:fa6a with SMTP id 006d021491bc7-6cd3fdbfe8dmr158239eaf.85.1789752099254;
        Fri, 18 Sep 2026 10:21:39 -0700 (PDT)
Received: from [192.168.254.51] ([66.97.168.37])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48739852afasm1477855fac.7.2026.09.18.10.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:21:37 -0700 (PDT)
From: Benjamin Coddington <ben.coddington@hammerspace.com>
X-Google-Original-From: Benjamin Coddington <bcodding@hammerspace.com>
To: Chuck Lever <cel@kernel.org>
Cc: Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Christian Brauner <brauner@kernel.org>, David Howells <dhowells@redhat.com>,
 Sagi Grimberg <sagi@grimberg.me>, linux-nfs@vger.kernel.org,
 keyrings@vger.kernel.org, kernel-tls-handshake@lists.linux.dev,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC 0/5] NFS: isolate mTLS client credentials by network
 namespace
Date: Fri, 18 Sep 2026 13:21:34 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <2FBF57B6-FBB6-498F-A1F4-695D52EB89E9@hammerspace.com>
In-Reply-To: <20260918-nfs-mtls-identity-v1-0-197e568d78a7@kernel.org>
References: <20260918-nfs-mtls-identity-v1-0-197e568d78a7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 18 Sep 2026, at 10:05, Chuck Lever wrote:

> An xprtsec=mtls mount names its client certificate and private key
> by keyring serial, and tlshd reads those keys with its own
> credentials. Each key therefore has to grant user read permission,
> and any tlshd on the host that learns a serial can read it. Nothing
> separates one network namespace's credentials from another's.
>
> This series makes the network namespace the isolation domain. The
> RFC thread asked whether the user or mount namespace is the better
> binding. tlshd services the handshake socket of one network
> namespace, so that is the namespace it already lives in.
>
>   https://lore.kernel.org/linux-nfs/20260602154740.49861-1-cel@kernel.org/
>
> The keyring is held in struct nfs_net rather than found by name,
> because /proc/keys is not namespace scoped. Its serial travels with
> each handshake instead (patches 3-4), and tlshd's possession of that
> keyring is what lets a provisioned key grant no user read permission
> at all. Both ends of the link exist today, in tls_handshake_accept()
> and in tlshd. The handshake genetlink ABI and the cert_serial= and
> privkey_serial= mount options do not change.
>
> Still open is how userspace names the kernel-held keyring. Patch 5
> prototypes a request_key type handled in the kernel and tagged
> KEY_TYPE_NET_DOMAIN. A keyctl modeled on KEYCTL_GET_PERSISTENT, or a
> read-only attribute on the netns-tagged nfs_client sysfs kobject,
> would do the same job if the keyrings maintainers prefer one. Keys
> that userspace adds are quota-charged by user namespace while the
> keyring lives in nfs_net. Confirmation that this is sane when the
> two boundaries differ would be welcome.
>
> nfstlskey, the provisioning tool that consumes the key type, is
> merged in https://github.com/oracle/ktls-utils/ .
>
> Tested on one Fedora VM acting as both NFS client and NFSD, with
> tlshd from ktls-utils 1.4.0: NFSv4.2 mounts with xprtsec=tls, with
> xprtsec=mtls using the identity in tlshd.conf, and with xprtsec=mtls
> using serials that nfstlskey provisioned.

I think this is the old upcall/namespace problem that's never been generally
solved (as far as I know).  Here's a shameless plug to potentially revive
the original "key agent" concept which solves this in a general way.

The idea is - user space processes (tlshd) register themselves as key-agents
that can satisfy request-key.  A key agent represents itself as a key-type,
and the appropriate key agent is consulted for request-key if the calling
process has that agent's key in its keyrings.

Otherwise, this solution looks good - but without a general solution to this
problem, other folks building on keyrings will keep trying to solve this
problem.

Ben

