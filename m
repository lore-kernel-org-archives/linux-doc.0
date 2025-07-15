Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D279241122
	for <linux-doc@vger.kernel.org>; Tue, 15 Jul 2025 19:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752606994; cv=none; b=LzCw/+Z1GStNusidMmKsa1vJvkSCtVSQmRjMAs1X+QCWZfqCCwfl1Apy9e8b47AL37ooPjmQNkax7ck/stUVN7TABIfCF2XtyOyso4Hp0J3AazyYWZLRDlCcAT4GYLswits0lYM8Pzm9j41b0ZWIvon7DXSHf0JWgr8n+9R5C1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752606994; c=relaxed/simple;
	bh=jmEenBBnJcPJ6JLSnRvcrVhxo7jKKE5kjzYF95A58vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jg9HeZ0FUuI+e2aC3wh+hjDSp5Lqux4n7TzZIhVNCacsh3o5O7QY+bVzb125cPX6SjdZee/60t5abHUK/yA2gwmGIctaVtxUnTI8jh19tuYx546PsgyNtKh+ZEfOUgv2l3cAz2pEXEgctn7MMNVGyYr1QEl//Dll/mGd6HRmdEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=k4G5FLYV; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="k4G5FLYV"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ab60e97cf8so34936051cf.0
        for <linux-doc@vger.kernel.org>; Tue, 15 Jul 2025 12:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1752606992; x=1753211792; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EyWMZNHH8t0HhJoB77UysafRoavoppKyzNMNzqOvChI=;
        b=k4G5FLYV7bs+tpC6ndMGLj+mSrqSyctAEH6RaNim3NJmvSrUn1EkTS+66geC66nhEo
         Qn84B9GfGOEWIxCOZnEi3wOd7lvDia3j5JlI6OWnPP1XN8Ui37F5AvjflaGrBXSRbM2J
         1pYiUQ7MEceodNTVBmh49Qq5/cOCpj0cwQzA9PIWSrRNzguRvVg4pOlgv2RM30vQWust
         xbNJnozB6gcZvjcimiGFgDLBc3I4ItzmlIIlxth7TSTr8yg2kczFtH3mxucAUJzEenBr
         k5Kjw7tlIPUTuolUm+PfsulCMxyeLgquZAQCnPfpgosDncccyVoaNPu++IQTzQtflme0
         dkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752606992; x=1753211792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyWMZNHH8t0HhJoB77UysafRoavoppKyzNMNzqOvChI=;
        b=AhgddA5PTcw33Ir8bt7oNRTGBlMUs9J+QrFlOQmMMOJ2J942BHEsVBfKDOqiwTLto4
         g6BW8ruhlpuovKjoNdXHagYCqJbX5qvhfcXwkoD2Ql1oPRv8/fSb4z8S277pxrk2y/7Y
         BV3icmTT+zDw2V/WLZtuAmCx7hVesJtpLrWnQ1zEtz3uz1s7PhbdjOkb097b+lXHS+CO
         EwxzRl/YreQPtqZd1d8/7IaFe9doCCgdD5XEdM9W4uSqbZngtGt0iGL2fL3WsmGGeprI
         b+vS1j0wkL+CzsR5apLQsCaBeYOlE8SM9kPUnU47tgRzwlCnRZVVjtxVHlA6/dK4qSZ9
         Y1bA==
X-Forwarded-Encrypted: i=1; AJvYcCVT15PpuKxnbXQtv4LsNn5DYGzhJ0EWifpcq7byQj4elj74uzelUbRyL0Fc5wvMr+CxaOwx1iUErxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUxXrHn/VlSJvqJF4RZS7FjFXBrQ+ce+4WBe5Zs1p2Hia3LyiQ
	eNdkNfbWCLuqUmKGrNDd+Ez4QUc+uOK+l3XuqHbrqyR6nMSTxvPfelhXVHgXCaS145s=
X-Gm-Gg: ASbGncufHC6oxNu4kGFArPTTd/AzSWe1ocyFiVp5id8+lf8rwAtjOhGm2VeQ+qAHB9h
	/vAJFYDX6MzO+E0wvXkITXpZEEbIZgNLQXaz+PEmV/vSY/vi2PhbkJnA5VxchEnmqZ6bv8w9dq5
	JbthBeIY2z/m5q8G0qQkX9QwR46H1cMZ9Q/kLzDUjUOzUV7KvS9z0aDMtKHOeU7tjCwPC5gXcXA
	S76O2qJ8CbHFHS2MI6rO/P6QgV7Swra+unx9qd7Dwa4D+G6QAK1yMQ6zCs4scFmsHHC0A00Cjkr
	tHralT71a/asjA72/VMLUkFCNN8lMymdGb6jE0McItM/pMEsvOLG9isKK7dSmshoHnfeztBKOK6
	9P8MUibNiwtCVMCjIDNTM+U5LHZpElCq2+VJkJaf4YNWQ5auLS9Q28XhQn4m5siOUZd5h4NpW1g
	==
X-Google-Smtp-Source: AGHT+IFNu6OS2CHvkVX/AFP0Ggu6QTgX/HryXXNt8GtSiABsUgLTgba9EtOOht2y1gHxuQnp05k70A==
X-Received: by 2002:ac8:5acc:0:b0:4a6:f9b0:2093 with SMTP id d75a77b69052e-4ab90cf6cfamr9216651cf.46.1752606991715;
        Tue, 15 Jul 2025 12:16:31 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edc593edsm64349751cf.21.2025.07.15.12.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 12:16:30 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ubl8f-00000008tB4-2UzY;
	Tue, 15 Jul 2025 16:16:29 -0300
Date: Tue, 15 Jul 2025 16:16:29 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Abhijit Gangurde <abhijit.gangurde@amd.com>, shannon.nelson@amd.com,
	brett.creeley@amd.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, corbet@lwn.net,
	andrew+netdev@lunn.ch, allen.hubbe@amd.com, nikhil.agarwal@amd.com,
	linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrew Boyer <andrew.boyer@amd.com>
Subject: Re: [PATCH v3 10/14] RDMA/ionic: Register device ops for control path
Message-ID: <20250715191629.GA2116306@ziepe.ca>
References: <20250702131803.GB904431@ziepe.ca>
 <20250702180007.GK6278@unreal>
 <bb0ac425-2f01-b8c7-2fd7-4ecf9e9ef8b1@amd.com>
 <20250704170807.GO6278@unreal>
 <15b773a4-424b-4aa9-2aa4-457fbbee8ec7@amd.com>
 <20250707072137.GU6278@unreal>
 <1a7190d4-f3ef-744c-4e46-8cb255dee6cf@amd.com>
 <20250707164609.GA592765@unreal>
 <76a68f62-1f73-cc81-0f5b-48a6982a54c7@amd.com>
 <20250713062753.GA5882@unreal>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250713062753.GA5882@unreal>

On Sun, Jul 13, 2025 at 09:27:53AM +0300, Leon Romanovsky wrote:
> Let's do what all other drivers do, please. I prefer simplest solution
> and objects that can potentially be around after verbs objects were
> cleaned doesn't sound right.

I think it is OK, at least QP makes sense and matches some other
drivers.

+static void ionic_qp_event(struct ionic_ibdev *dev, u32 qpid, u8 code)
+{
+       struct ib_event ibev;
+       struct ionic_qp *qp;
+
+       rcu_read_lock();
+       qp = xa_load(&dev->qp_tbl, qpid);
+       if (qp)
+               kref_get(&qp->qp_kref);
+       rcu_read_unlock();
+

The above is an async event path, and the kref is effectively the open
coded rwlock pattern we use often.

The unlock triggers a completion:

+       kref_put(&qp->qp_kref, ionic_qp_complete);
+static inline void ionic_qp_complete(struct kref *kref)
+{
+       struct ionic_qp *qp = container_of(kref, struct ionic_qp, qp_kref);
+       
+       complete(&qp->qp_rel_comp);
+}

Which acts as the unlock. And then qp destruction:

+int ionic_destroy_qp(struct ib_qp *ibqp, struct ib_udata *udata)
+{
+       kref_put(&qp->qp_kref, ionic_qp_complete);
+       wait_for_completion(&qp->qp_rel_comp);

Which is the typical "write" side of the lock.

So this is all normal, the qp doesn't outlive destroy, destroy waits
for all the async event deliver to complete. It has to, we free the
underlying memory in the core code.

As long as the other case are like this it is fine

+       xa_erase_irq(&dev->qp_tbl, qp->qpid);
+       synchronize_rcu();

This should go away though, don't like to see synchronize_rcu(). The
idea is you kfree the QP with RCU. But the core code doesn't do that..

So in the short term you should take the lock instead of using rcu:

       xa_lock(&dev->qp_tbl);
       qp = xa_load(&dev->qp_tbl, qpid);
       if (qp)
               kref_get(&qp->qp_kref);

Jason
