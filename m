Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EAD48CD5B
	for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 11:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989437; cv=none; b=nOStMr8qhPP/7T/KbtqZEBuBhxNpOSKCiqvnGOTqIiuXSE9tgq8GPYgm4SOZTbsFFPKoTz9zUbmcDLI4ysppuanyE9SaDwzCLkoPbH7jENyAKmwtkbqUwPkfdvgGYo+L8QPODyiL9FIVLP6vczTGekV1xV41WUdALqquF2AWaiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989437; c=relaxed/simple;
	bh=ynnB93uRRMFm5MeLrvG8YOly/C5erKJyFzwadvMCU78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tJTF4oMDwTQ/JnD41J6uJ+DPUzzXGxoAw02UGxc+XT+3blFbkzr/iDpHulFMq3YKdkKSacRemFRBjeoBUkKCcA4HnunKpUVMogPeYVEX+LCsrbpfXROI4jZADe/JSl6NJKkuKYraxks1BjSUMTJ8Ob3Uss4FiVsWLXO4IIJsP1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com; spf=pass smtp.mailfrom=hammerspace.com; dkim=pass (2048-bit key) header.d=hammerspace.com header.i=@hammerspace.com header.b=OeVHCE/4; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammerspace.com header.i=@hammerspace.com header.b="OeVHCE/4"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccdd76a9so2501049fac.0
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 04:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammerspace.com; s=google; t=1789989434; x=1790594234; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oFZAXGGRVdUcw8Z+HbfAgS1Po8zavpuqYE8I7GH9OYY=;
        b=OeVHCE/44f64CBJemBAiL6V0NXnT+2k2G6FuqpPJ2NvL3jn/OzHBy3zmigLebeF3ws
         VTKWnS5+dt/JPdWDYy94Jr5K5lI5I8dQ/RewOkjcGsh6JziE6HLvcii9zeJbsxNeNwOu
         A6a2IDjYJvlmArYTS/aJ9gRC7R8DHHKV3fEwHggvZfrIQkEzKFeMdaXWcBKO+Ez0CEd2
         zslOObRQPygzT3dIyYFfy1Vt9rqFaGA5RdcQHK7t/UhHN8E0guQvyT0tUCrCbDXRveuu
         1pj9lJAah1Bz1tAFGqlxe/DNU3s41rLTkNkreqkC6u97XBqBCFjZlevHfgMKx7oOrV6t
         TkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989434; x=1790594234;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oFZAXGGRVdUcw8Z+HbfAgS1Po8zavpuqYE8I7GH9OYY=;
        b=ERhrfcrfe4VaEOLa43OTE4Jnrt5unIPj7pPiEuwysZMH86BtB7MxgpTmNuEmiNldp6
         Wf0uuxpo2deieJXoSKbcfOqxXbCRiw8L429XwRKZpJtQp7ScsFoQbh48SxOi3Fjtg4U8
         OSFZaJQzH+gVrmbaT1Mlb3YekyYhu3oav7OiOrWk5IU+GaZ1iuiVu+3e98OJKwHBrX+A
         29Ji8dFbfZJ96BebOyA0rWLOB4MdsUSK+m+OSqGCp5dIGo0W3vydGW1kpUC/hEGXJqeL
         bYgeGCxhy6VMnQHosGBtx2J3lPwQQpIzTK8TPRjcaylSatIt5FEOPz8EFWzxaEYJ+8VI
         qjjg==
X-Forwarded-Encrypted: i=1; AKwUvByU0srlJAABCl37A9XoHmutLpsqN+/zYBngdDqFbQTzRZ/eG3gPLos/cIEpSyHygdoqU5p2i6oQ0Js=@vger.kernel.org
X-Gm-Message-State: AFuF++mDFUVBK7WktvPXHVsBMwQoHogJkBuq/yMSZ6ekJzG5GbPiACr/
	64XUQ4+vz0V/HHcyyiXqRj6DD1NBau2B039VdVgDlgAXvFgP5bFmzKwAWD2mMOEOXdM=
X-Gm-Gg: AYBFou2iKgU4p6ZkPcCqT2fbtTw00tpmLxBOX6EGaR6tMJ4XfZ4gRdDJDr+Jq28WxOQ
	W0PiwGjp28UeBuwVYuGQXqyDVlDiGAPg6Z5c395fuVAmQ3e4bOepFjDLAeGRQgBW5jy0SBqLB9c
	p6E7MZjModynXzEAHZD2uKAytOJMB85vCDWTE/iT2knv/B0D4WnFCkdsSIe46yaRN4RcbZWn2IK
	ipYY6zg+rp/W0pBMGrU/Bjy/XkwC/TbHZWKfVbCASSQkt4sGcJbCrQyw5rEp7fdUwMV6ff9B+TT
	kuLPtpK4o6COp65SCMYFkQBZ4M2wB/FZTZvAONiU/T6gi0Ep76Ol19+XUXDvEO+0jAoW0qefSbS
	sIyZXX+nT/c0OdfrBnx0lorgYCJDa28jKYekPtnNSUyTW5pFVmlxoOauc1gvyPqFIk3XvV1TIC0
	7Uwstjx/AwZFsgbwItMSrb4MY6J0I0LSM3NwMQMcSJTa5OZJrCeyeGF9AdVYvinjB81Chz7QKoN
	hnwyOMG7f7gRzaSHA==
X-Received: by 2002:a05:6871:64a:b0:465:fdf:bd44 with SMTP id 586e51a60fabf-486e574f446mr8866000fac.14.1789989434138;
        Mon, 21 Sep 2026 04:17:14 -0700 (PDT)
Received: from [192.168.254.51] ([66.97.168.37])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48820f30ce7sm7756232fac.3.2026.09.21.04.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:17:13 -0700 (PDT)
From: Benjamin Coddington <ben.coddington@hammerspace.com>
X-Google-Original-From: Benjamin Coddington <bcodding@hammerspace.com>
To: Hannes Reinecke <hare@suse.de>
Cc: Benjamin Coddington <ben.coddington@hammerspace.com>,
 Chuck Lever <cel@kernel.org>, Trond Myklebust <trondmy@kernel.org>,
 Anna Schumaker <anna@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Christian Brauner <brauner@kernel.org>,
 David Howells <dhowells@redhat.com>, Sagi Grimberg <sagi@grimberg.me>,
 linux-nfs@vger.kernel.org, keyrings@vger.kernel.org,
 kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC 0/5] NFS: isolate mTLS client credentials by network
 namespace
Date: Mon, 21 Sep 2026 07:17:10 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <FF0D8D15-2520-4B42-AED4-4FAB4D461D70@hammerspace.com>
In-Reply-To: <5a7830fd-7823-476b-84aa-3b01ca81ccdf@suse.de>
References: <20260918-nfs-mtls-identity-v1-0-197e568d78a7@kernel.org>
 <2FBF57B6-FBB6-498F-A1F4-695D52EB89E9@hammerspace.com>
 <5a7830fd-7823-476b-84aa-3b01ca81ccdf@suse.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 21 Sep 2026, at 4:45, Hannes Reinecke wrote:

> On 9/18/26 7:21 PM, Benjamin Coddington wrote:
>> On 18 Sep 2026, at 10:05, Chuck Lever wrote:
>>
>>> An xprtsec=mtls mount names its client certificate and private key
>>> by keyring serial, and tlshd reads those keys with its own
>>> credentials. Each key therefore has to grant user read permission,
>>> and any tlshd on the host that learns a serial can read it. Nothing
>>> separates one network namespace's credentials from another's.
>>>
>>> This series makes the network namespace the isolation domain. The
>>> RFC thread asked whether the user or mount namespace is the better
>>> binding. tlshd services the handshake socket of one network
>>> namespace, so that is the namespace it already lives in.
>>>
>>>    https://lore.kernel.org/linux-nfs/20260602154740.49861-1-cel@kernel.org/
>>>
>>> The keyring is held in struct nfs_net rather than found by name,
>>> because /proc/keys is not namespace scoped. Its serial travels with
>>> each handshake instead (patches 3-4), and tlshd's possession of that
>>> keyring is what lets a provisioned key grant no user read permission
>>> at all. Both ends of the link exist today, in tls_handshake_accept()
>>> and in tlshd. The handshake genetlink ABI and the cert_serial= and
>>> privkey_serial= mount options do not change.
>>>
>>> Still open is how userspace names the kernel-held keyring. Patch 5
>>> prototypes a request_key type handled in the kernel and tagged
>>> KEY_TYPE_NET_DOMAIN. A keyctl modeled on KEYCTL_GET_PERSISTENT, or a
>>> read-only attribute on the netns-tagged nfs_client sysfs kobject,
>>> would do the same job if the keyrings maintainers prefer one. Keys
>>> that userspace adds are quota-charged by user namespace while the
>>> keyring lives in nfs_net. Confirmation that this is sane when the
>>> two boundaries differ would be welcome.
>>>
>>> nfstlskey, the provisioning tool that consumes the key type, is
>>> merged in https://github.com/oracle/ktls-utils/ .
>>>
>>> Tested on one Fedora VM acting as both NFS client and NFSD, with
>>> tlshd from ktls-utils 1.4.0: NFSv4.2 mounts with xprtsec=tls, with
>>> xprtsec=mtls using the identity in tlshd.conf, and with xprtsec=mtls
>>> using serials that nfstlskey provisioned.
>>
>> I think this is the old upcall/namespace problem that's never been generally
>> solved (as far as I know).  Here's a shameless plug to potentially revive
>> the original "key agent" concept which solves this in a general way.
>>
>> The idea is - user space processes (tlshd) register themselves as key-agents
>> that can satisfy request-key.  A key agent represents itself as a key-type,
>> and the appropriate key agent is consulted for request-key if the calling
>> process has that agent's key in its keyrings.
>>
>> Otherwise, this solution looks good - but without a general solution to this
>> problem, other folks building on keyrings will keep trying to solve this
>> problem.
>>
> Not sure. Basic problem with the 'upcall' mechanism is that it needs to
> execute a userspace program by the time of the upcall.
> And that (trivially) requires
> a) a usable userspace to be present
> and
> b) the correct program to be be available

Yes..

The key agent worked similarly to tlshd - it wasn't the old request-key
upcall mech.  In fact, tlshd and its netlink interface could easily be
adapted into this key-agent-as-a-key.

Its a trade-off that allows you to route the upcall via how keys are
linked in the calling process, rather than by some defined-in-code domain
like "same network namespace".

Ben
