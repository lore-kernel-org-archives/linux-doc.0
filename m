Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L5KH1S4E"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95D8DAD
	for <linux-doc@vger.kernel.org>; Thu, 16 Nov 2023 06:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700145984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IckApcOFTKD0Zq5CFGG8otwwBEuHyo7wV7sUgTFZ3oY=;
	b=L5KH1S4EJfLcni+WURzS7/EQukpA5smvaTrt2yZ+7LPKiq4IWpmd1fVnI6XeVm5fdBB+Lq
	zuZwYOvu5qcbOyQBy1bPykKRvYU6Pr2Yf/gjodS2qYK/v/5bglaNfm6loZl6GEM6BOpNwy
	L3m7d6Nomez+v1fNhHYmhXdiC4k/G3c=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-654-2W8ZZtspP6OxzrCV1QMNKg-1; Thu,
 16 Nov 2023 09:46:20 -0500
X-MC-Unique: 2W8ZZtspP6OxzrCV1QMNKg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 120FE3C0C485;
	Thu, 16 Nov 2023 14:46:20 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.23])
	by smtp.corp.redhat.com (Postfix) with SMTP id 91CD27AD9;
	Thu, 16 Nov 2023 14:46:17 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Thu, 16 Nov 2023 15:45:16 +0100 (CET)
Date: Thu, 16 Nov 2023 15:45:13 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Alexey Gladkov <legion@kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] seqlock: fix the wrong
 read_seqbegin_or_lock/need_seqretry documentation
Message-ID: <20231116144513.GA28790@redhat.com>
References: <20231024120808.GA15382@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024120808.GA15382@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

Ping.

Please ignore 2/2 for now (it obviously wasn't for inclusion),
but the wrong documentation confuses the users.

fs/afs, rxrpc_find_service_conn_rcu, nfsd_copy_write_verifier
use read_seqbegin_or_lock/need_seqretry according to this doc
and they are wrong.

I am discussing the necessary changes in the code paths above,
but can't we fix the documentation?

On 10/24, Oleg Nesterov wrote:
>
> Half of the read_seqbegin_or_lock's users are buggy (I'll send the
> fixes), and I guess this is because the documentation and the pseudo
> code in Documentation/locking/seqlock.rst are wrong.
> 
> Pseudo code:
> 
> 	int seq = 0;
> 	do {
> 		read_seqbegin_or_lock(&foo_seqlock, &seq);
> 
> 		/* ... [[read-side critical section]] ... */
> 
> 	} while (need_seqretry(&foo_seqlock, seq));
> 
> read_seqbegin_or_lock() returns with the even seq, need_seqretry()
> doesn't change this counter. This means that seq is always even and
> thus the locking pass is simply impossible.
> 
> IOW, "_or_lock" has no effect and this code doesn't differ from
> 
> 	do {
> 		seq = read_seqbegin(&foo_seqlock);
> 
> 		/* ... [[read-side critical section]] ... */
> 
> 	} while (read_seqretry(&foo_seqlock, seq));
> 
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---
>  Documentation/locking/seqlock.rst | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/locking/seqlock.rst b/Documentation/locking/seqlock.rst
> index bfda1a5fecad..4bdf8d4ed2a2 100644
> --- a/Documentation/locking/seqlock.rst
> +++ b/Documentation/locking/seqlock.rst
> @@ -218,13 +218,14 @@ Read path, three categories:
>     according to a passed marker. This is used to avoid lockless readers
>     starvation (too much retry loops) in case of a sharp spike in write
>     activity. First, a lockless read is tried (even marker passed). If
> -   that trial fails (odd sequence counter is returned, which is used as
> -   the next iteration marker), the lockless read is transformed to a
> -   full locking read and no retry loop is necessary::
> +   that trial fails (sequence counter doesn't match), make the marker
> +   odd for the next iteration, the lockless read is transformed to a
> +   full locking read and no retry loop is necessary, for example::
>  
>  	/* marker; even initialization */
> -	int seq = 0;
> +	int seq = 1;
>  	do {
> +		seq++; /* 2 on the 1st/lockless path, otherwise odd */
>  		read_seqbegin_or_lock(&foo_seqlock, &seq);
>  
>  		/* ... [[read-side critical section]] ... */
> -- 
> 2.25.1.362.g51ebf55
> 

