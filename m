Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792425561;
	b=NaEvLLkDzrRG3fzNj9HYGEYoccy8Ha864K3RDLqu55KJSHrsyniyVsCERotHlEjcByXC
	 rPFhOteUsBs+4YvuG6ko2mzUM1hEOXsjVjUJH6bXCSpIORjXZZ7ZRzZTg/6xRrt8sa7Pv
	 Rg0I+AD/jGKsYEM49iISwBJufhwJuYvBUtN1GHwnGRi8dvns1vTuMiscF00V1cJVecMM+
	 E2TIZvCQUkq95oxvDu1/HM725oLFi5KSksWdR+0Ufvl+yHi3eFKS711Pn9GgXkJaiCKFd
	 F5g0BMt57lirkQAyD05v8z/+OYf4cWnvn1Z5ruPsc4OxcaLXQ5LanMFVxwsbLXIw13Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792425561;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Organization:From:In-Reply-To:
	 References:To:Cc:Subject:MIME-Version:Content-Type:Content-ID:Date:
	 Message-ID:X-Scanned-By;
	bh=mxDUftepPPOUZ/7SCslBnNQlYRdDOMe7AAGS48la1a8=;
	b=cDxLQGUVvXi6nwEZ1SHjeBu9jmOaVhP1vq2ExvAbY1yk/V07xE5zQJtppc16495fJfT8
	 6AYPdZM5zhI+LoexW7be7ec3FGsHeP15evLgCVm2fV33dhKd6ZyY9KBHSjdcAIXAEzVLc
	 A5Nur3alZ8KW9+qpX3OihLJzQS31WOGxgrF1rJvuZjQbyj+WLbNHcB+eeQi08YUDSiq6K
	 KtlBbeMCzREwpc+JyauNHRPqHLEV4yVgtZDBJxZgjCZz/XRvuwT0i4VnDKdM4Z8GDBdQY
	 4QdzQ1MvOYD4+PMJnUsBCHuBiX7EaEKs51g2MBqe/op+KV/3MIO+qd0s6EKVn7A1ZCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QwKyVLxd;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BFA606AAFC
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 15:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5BFA606AAFC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QwKyVLxd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792425559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mxDUftepPPOUZ/7SCslBnNQlYRdDOMe7AAGS48la1a8=;
	b=QwKyVLxdPdMTxnefW4PcSAaZhAsraCHaiMhuwiPtOklMnhUmiIwHPgcG3AUL3aGT36GkDa
	mR/uXtWM49OvAaNIoIFbyue8b3SLLW8znj1bmYy+FeoeW3gCoMxdZ59Bkj4292oUpMwXqU
	d6jkcp35esRGpb2IRF2GhcSFD5pIcy4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-213-I0xvQN0zMnCVxghSPcACeA-1; Mon,
 19 Oct 2026 15:59:18 +0000
X-MC-Unique: I0xvQN0zMnCVxghSPcACeA-1
X-Mimecast-MFC-AGG-ID: I0xvQN0zMnCVxghSPcACeA_1792425556
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0F64A1954ACF;
	Mon, 19 Oct 2026 15:59:16 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.48.11])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0AFCA41B;
	Mon, 19 Oct 2026 15:59:11 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20261019145624.309790-2-jarkko@kernel.org>
References: <20261019145624.309790-2-jarkko@kernel.org> <20261019145624.309790-1-jarkko@kernel.org>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: dhowells@redhat.com, keyrings@vger.kernel.org,
    Eric Biggers <ebiggers@kernel.org>, stable@vger.kernel.org,
    Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>,
    Shuah Khan <skhan@linuxfoundation.org>,
    Randy Dunlap <rdunlap@infradead.org>,
    Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
    "Serge E. Hallyn" <serge@hallyn.com>,
    linux-doc@vger.kernel.org (open
                         list:DOCUMENTATION),
    linux-kernel@vger.kernel.org (open list),
    linux-security-module@vger.kernel.org (open
                         list:SECURITY SUBSYSTEM)
Subject: Re: [PATCH v2 2/2] KEYS: Reject keyring creation with overridden credentials
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2610819.1792425550.1@warthog.procyon.org.uk>
Date: Mon, 19 Oct 2026 16:59:10 +0100
Message-ID: <2610820.1792425550@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Would it make sense to just reject KEY_LOOKUP_CREATE at the top of the
function if the creds are overridden?

David

