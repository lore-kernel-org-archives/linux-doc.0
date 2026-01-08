Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4A333344D
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 23:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767914827; cv=none; b=amy4AvpoChBqOM1rEurRIO8iReZuhr1buOggwf6trxHqEXGrZ37bAMHX09LRr4SwF6nBNLj+IddYvc6+Mh8Q26qmxIF77eW4UW0Mh9Y69HSEI+yU8TC+XXDwj9g5eE7h3n5jLb33UR4ksbnGQ92iy5mj8+52VCuJtHD2fHNpxRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767914827; c=relaxed/simple;
	bh=q/w2OHcDBmglSw3DmZWycMkP40pwy6rwq9Ljdbui14k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpHTd3aYl8cMotcbRPEGkUK3woyjqzUSToeqCLulznk887uCrdTw14cLAuWyKI3LlEfSye33Cf7YDKP17yHVlT9jkJ3zpRNla2JSxJBR31RPli5Trv4LUegJ8c9piGNzBVG9CeJEADv70kE3cphnuCe65m/k/BMw8zOB54J50oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GiYbvqxv; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GiYbvqxv"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47d3ffa6720so38356475e9.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 15:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767914824; x=1768519624; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJVnWCv1er1yEKW3Zzjqu5S3R8api15dEl8a9iGdG3k=;
        b=GiYbvqxveXHimZB0cY0IPQGwtddGMXUFMQUq4vFCoukkq7vITxdgRtEVA1LjOdhDlb
         EBQBGkY1rMMkjm+FSUmKwkAh5KnO21QhLSlgv2J0nPv55u6niA1zqm4U4Uo8WDI4XdKq
         /6dsit2B4hHHyJrjVQA6IRBvVafZo1fwswK4gRdLEe1tcqpy/lH89/u4+LxJ91TccgZB
         WC4ZnwLsgsY4DEYJQvCg+twqXCOAVkpieIZE0R+e5H2UiaAL+h6T/OteGJcfPXsUUe2z
         YAhekXP47hmDWItii+2w7hUcyn56P3vWU5skC7b8UAu2sTNGTZcgl3rT5j1sVJIux09t
         aS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767914824; x=1768519624;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VJVnWCv1er1yEKW3Zzjqu5S3R8api15dEl8a9iGdG3k=;
        b=bx+T1R9dyXOloLgZn8VoZFJ1rAqUSBrX/o8atXmIW1UXneOwxKy3wfMkxxCDR9Z4xV
         0Lp8RnaB2u6e2CR/baMxGkTtBzHTQ8iB024P9HckYPltmLagdQ67cM2re8aYxTZgux4J
         bd+qY6RJ0tueBz8APeiWhonG5vlz7XeGidkmAkU7hpwrsUNKG3rqNVdqfpMSciBv8KYF
         W6HckobdMFVmyLnzJnPajK+SSDjGE4BKAsIMIpcthCvN4Sr2rtYDKUidEeguV4RBKxen
         GFZJXC+YrR30d5ZnSwj9NxvUVi3LFTqWT/tlNz7RgSRLG3PhdobXFa0vpLL9OFj1CfqX
         GcHw==
X-Forwarded-Encrypted: i=1; AJvYcCUPXV4G4PngDSgsxY4Vt1LJrnNtZ5k086/X2BfkJBo6yvCfOILBYfDquw8HI8MqehgEkN8Ef8PJYUc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9zZo+VjLHWceAJmjjQExXnzHwaYs07fdAmGROfI02sTQjHemU
	oysypVxj8dFAGNAmLTm1A4MlgIEUtFgyDlf8or6yt0xMR6zM2IEyBdUsJLnB2mD3Qg==
X-Gm-Gg: AY/fxX4+4IA1L3m4KFKoJwYa4HtWCkpQMlhVJyLLiF/nOa/0N68D1/1Y7bOHQN0Osm3
	WD1VjuXjVjLZuudJ2v/iloa09w/rT6O2qRObBRFMiDqpQFTZGFuoPUvvGzWOXLF1pTZNJRd+6jT
	AJ3SRnJh6PxExLxkihEvmBSfYtQRuSKDxofE0LHhe30ni01WJ4JmMfvMioYbo0C9jFoXL5+HL1Y
	0McPVaCFrhPr8qWU5jO6EodmaXsZqC+t0OYJwxiTP9mc3+ZeyGOEUweF1VC/BMUs8FRsSDavbTp
	eubT4dXT4ey0v+5fSQ02ZifBW11Hbq75WvEPqo9IOoq+NqP7/FF8GXM4MWkgcyz5dGyPzKNu/Ie
	FgrjOhkSRSUezx9hc1TpoYCTFrq5MRPzjgUmWlePqtEwt1uHgC7bRmgEWk/olFWC9u2QyLT3m3+
	cnpP6yJP6S9skyAl7cjTOw13zoznIzWTNzjEBKrAMeephh8w8l
X-Google-Smtp-Source: AGHT+IHhn5oqqXEXdXppHSooBMMRAzilyWn+PndcRbByujPILqHWwWxt63fu3OjbgMJmLJjeeFi/pw==
X-Received: by 2002:a05:600c:4ed4:b0:471:14f5:126f with SMTP id 5b1f17b1804b1-47d84b41181mr100523185e9.33.1767914823835;
        Thu, 08 Jan 2026 15:27:03 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:2834:9:384b:578b:5b8e:a6f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d871a1e11sm46386595e9.19.2026.01.08.15.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 15:27:03 -0800 (PST)
Date: Fri, 9 Jan 2026 00:26:55 +0100
From: Marco Elver <elver@google.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
	Chris Li <sparse@chrisli.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>,
	Dmitry Vyukov <dvyukov@google.com>,
	Eric Dumazet <edumazet@google.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ian Rogers <irogers@google.com>, Jann Horn <jannh@google.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Josh Triplett <josh@joshtriplett.org>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Kentaro Takeda <takedakn@nttdata.co.jp>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Thomas Gleixner <tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>,
	Uladzislau Rezki <urezki@gmail.com>,
	Waiman Long <longman@redhat.com>, kasan-dev@googlegroups.com,
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-security-module@vger.kernel.org,
	linux-sparse@vger.kernel.org, linux-wireless@vger.kernel.org,
	llvm@lists.linux.dev, rcu@vger.kernel.org
Subject: Re: [PATCH v5 10/36] locking/mutex: Support Clang's context analysis
Message-ID: <aWA9P3_oI7JFTdkC@elver.google.com>
References: <20251219154418.3592607-1-elver@google.com>
 <20251219154418.3592607-11-elver@google.com>
 <57062131-e79e-42c2-aa0b-8f931cb8cac2@acm.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57062131-e79e-42c2-aa0b-8f931cb8cac2@acm.org>
User-Agent: Mutt/2.2.13 (2024-03-09)

On Thu, Jan 08, 2026 at 02:10PM -0800, 'Bart Van Assche' via kasan-dev wrote:
> On 12/19/25 8:39 AM, Marco Elver wrote:
> > diff --git a/include/linux/mutex.h b/include/linux/mutex.h
> > index bf535f0118bb..89977c215cbd 100644
> > --- a/include/linux/mutex.h
> > +++ b/include/linux/mutex.h
> > @@ -62,6 +62,7 @@ do {									\
> >   	static struct lock_class_key __key;				\
> >   									\
> >   	__mutex_init((mutex), #mutex, &__key);				\
> > +	__assume_ctx_lock(mutex);					\
> >   } while (0)
> 
> The above type of change probably will have to be reverted. If I enable
> context analysis for the entire kernel tree, drivers/base/devcoredump.c
> doesn't build. The following error is reported:
> 
> drivers/base/devcoredump.c:406:2: error: acquiring mutex '_res->mutex' that
> is already held [-Werror,-Wthread-safety-analysis]
>   406 |         mutex_lock(&devcd->mutex);
>       |         ^
> 
> dev_coredumpm_timeout() calls mutex_init() and mutex_lock() from the same
> function. The above type of change breaks compilation of all code
> that initializes and locks a synchronization object from the same
> function. My understanding of dev_coredumpm_timeout() is that there is a
> good reason for calling both mutex_init() and mutex_lock() from that
> function. Possible solutions are disabling context analysis for that
> function or removing __assume_ctx_lock() again from mutex_init(). Does
> anyone want to share their opinion about this?

Probably the most idiomatic option is to just factor out construction.
Clearly separating complex object construction from use also helps
readability regardless, esp. where concurrency is involved. We could
document such advice somewhere.

For the above case, this seems cleanest and also clearer to me:

diff --git a/drivers/base/devcoredump.c b/drivers/base/devcoredump.c
index 55bdc7f5e59d..56ac8aa41608 100644
--- a/drivers/base/devcoredump.c
+++ b/drivers/base/devcoredump.c
@@ -339,6 +339,40 @@ void dev_coredump_put(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(dev_coredump_put);
 
+static struct devcd_entry *
+dev_coredumpm_init(struct device *dev, struct module *owner, void *data,
+		   size_t datalen, gfp_t gfp,
+		   ssize_t (*read)(char *buffer, loff_t offset, size_t count,
+				   void *data, size_t datalen),
+		   void (*free)(void *data))
+{
+	static atomic_t devcd_count = ATOMIC_INIT(0);
+	struct devcd_entry *devcd;
+
+	devcd = kzalloc(sizeof(*devcd), gfp);
+	if (!devcd)
+		return NULL;
+
+	devcd->owner = owner;
+	devcd->data = data;
+	devcd->datalen = datalen;
+	devcd->read = read;
+	devcd->free = free;
+	devcd->failing_dev = get_device(dev);
+	devcd->deleted = false;
+
+	mutex_init(&devcd->mutex);
+	device_initialize(&devcd->devcd_dev);
+
+	dev_set_name(&devcd->devcd_dev, "devcd%d",
+		     atomic_inc_return(&devcd_count));
+	devcd->devcd_dev.class = &devcd_class;
+
+	dev_set_uevent_suppress(&devcd->devcd_dev, true);
+
+	return devcd;
+}
+
 /**
  * dev_coredumpm_timeout - create device coredump with read/free methods with a
  * custom timeout.
@@ -364,7 +398,6 @@ void dev_coredumpm_timeout(struct device *dev, struct module *owner,
 			   void (*free)(void *data),
 			   unsigned long timeout)
 {
-	static atomic_t devcd_count = ATOMIC_INIT(0);
 	struct devcd_entry *devcd;
 	struct device *existing;
 
@@ -381,27 +414,10 @@ void dev_coredumpm_timeout(struct device *dev, struct module *owner,
 	if (!try_module_get(owner))
 		goto free;
 
-	devcd = kzalloc(sizeof(*devcd), gfp);
+	devcd = dev_coredumpm_init(dev, owner, data, datalen, gfp, read, free);
 	if (!devcd)
 		goto put_module;
 
-	devcd->owner = owner;
-	devcd->data = data;
-	devcd->datalen = datalen;
-	devcd->read = read;
-	devcd->free = free;
-	devcd->failing_dev = get_device(dev);
-	devcd->deleted = false;
-
-	mutex_init(&devcd->mutex);
-	device_initialize(&devcd->devcd_dev);
-
-	dev_set_name(&devcd->devcd_dev, "devcd%d",
-		     atomic_inc_return(&devcd_count));
-	devcd->devcd_dev.class = &devcd_class;
-
-	dev_set_uevent_suppress(&devcd->devcd_dev, true);
-
 	/* devcd->mutex prevents devcd_del() completing until init finishes */
 	mutex_lock(&devcd->mutex);
 	devcd->init_completed = false;
