Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 281547D04D
	for <lwn-linux-doc@archive.lwn.net>; Sat,  6 Apr 2019 02:17:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbfDFCRL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 5 Apr 2019 22:17:11 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:37116 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726271AbfDFCRL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Apr 2019 22:17:11 -0400
Received: by mail-qt1-f194.google.com with SMTP id z16so9672736qtn.4
        for <linux-doc@vger.kernel.org>; Fri, 05 Apr 2019 19:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mwnDvhRAXQsmRhUTdqUrC7h2+vpZvRJbp0l/Sl+DWPg=;
        b=QlPMs8WSaGShCE73RlTERVvarOADFKZNiYsM8Vq8+/jCjzbktW8n0KHTnjoGkzTAl0
         slWMlC/L64cXhuXWy7qS2FvyljUDJvZ/c1l3BilipbMLIpMIgL3WW62zY4q8NN4yQrGU
         bdrhgDJlqFEcbmV8a5815Gi86KuM/9bOofOsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mwnDvhRAXQsmRhUTdqUrC7h2+vpZvRJbp0l/Sl+DWPg=;
        b=Gybjv7IP4lViT4Sb5IRFRSO/gz34wobo+mD7/rdXhHCVsFQsG8iMt7EQaTeaV3novU
         /AONavD1sqSj4wXrsgkCB8gab2sautanFuUiyLMxf5NFE/PwgBripALFnfUDRbAtyDby
         5AAcGmpiJr14eMfF/jnl2IEECMQRoFWgrfZcRTwIo1QsNKv2yijFpKOdbDrtERDT2jfj
         TeRKSslOH7ush1R8Rc+VrkFmhTB6pe084Kox7iOQhPKH0JlvV1+nIB1IJWJpz/Ag84gu
         boTyClEytQ89AmOhPI1W+Kpm4e8Yvpbq4j/4/sh33ZVfHVwDx9Hp4Lr54UDYv6o1bPM7
         7gaw==
X-Gm-Message-State: APjAAAW3k5vt3svD3SazRIpvweIqPr34c0sI96SNWFIUGs4eSS9Rdd7L
        fWQVSjI5HXhl1nljacYljg4RtQ==
X-Google-Smtp-Source: APXvYqxqGKAqvxbt3FjD0IcdnctDCIBixzH0diTc1fM9Bpc5kbczuiOxQMFGluzLTj4sq4vo7oFdrA==
X-Received: by 2002:aed:3ee7:: with SMTP id o36mr14396378qtf.355.1554517029885;
        Fri, 05 Apr 2019 19:17:09 -0700 (PDT)
Received: from localhost (c-73-216-90-110.hsd1.va.comcast.net. [73.216.90.110])
        by smtp.gmail.com with ESMTPSA id k4sm7921188qki.15.2019.04.05.19.17.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Apr 2019 19:17:08 -0700 (PDT)
Date:   Sat, 6 Apr 2019 02:17:05 +0000
From:   Joel Fernandes <joel@joelfernandes.org>
To:     "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc:     linux-kernel@vger.kernel.org, oleg@redhat.com, jannh@google.com,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2] doc/rcuref: Document real world examples in kernel
Message-ID: <20190406021705.GA6615@localhost>
References: <20190329140555.118463-1-joel@joelfernandes.org>
 <20190404201039.GL14111@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190404201039.GL14111@linux.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 04, 2019 at 01:10:39PM -0700, Paul E. McKenney wrote:
> On Fri, Mar 29, 2019 at 10:05:55AM -0400, Joel Fernandes (Google) wrote:
> > Document similar real world examples in the kernel corresponding to the
> > second and third code snippets. Also correct an issue in
> > release_referenced() in the code snippet example.
> > 
> > Cc: oleg@redhat.com
> > Cc: jannh@google.com
> > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> 
> Good catch, thank you!
> 
> As usual, I could not resist doing a bit of wordsmithing.  Please let me
> know if I messed anything up in the version shown below.
> 
> 								Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit adcd92c0ab303b57b28a3cd097bd9ece824c14f6
> Author: Joel Fernandes (Google) <joel@joelfernandes.org>
> Date:   Fri Mar 29 10:05:55 2019 -0400
> 
>     doc/rcuref: Document real world examples in kernel
>     
>     Document similar real world examples in the kernel corresponding to the
>     second and third code snippets. Also correct an issue in
>     release_referenced() in the code snippet example.
>     
>     Cc: oleg@redhat.com
>     Cc: jannh@google.com
>     Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
>     [ paulmck: Do a bit of wordsmithing. ]
>     Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>
> 
> diff --git a/Documentation/RCU/rcuref.txt b/Documentation/RCU/rcuref.txt
> index 613033ff2b9b..c0bab7fb57e7 100644
> --- a/Documentation/RCU/rcuref.txt
> +++ b/Documentation/RCU/rcuref.txt
> @@ -12,6 +12,7 @@ please read on.
>  Reference counting on elements of lists which are protected by traditional
>  reader/writer spinlocks or semaphores are straightforward:
>  
> +CODE LISTING A:
>  1.				2.
>  add()				search_and_reference()
>  {				{
> @@ -28,7 +29,8 @@ add()				search_and_reference()
>  release_referenced()			delete()
>  {					{
>      ...					    write_lock(&list_lock);
> -    atomic_dec(&el->rc, relfunc)	    ...
> +    if(atomic_dec_and_test(&el->rc))	    ...
> +	kfree(el);
>      ...					    remove_element
>  }					    write_unlock(&list_lock);
>   					    ...
> @@ -44,6 +46,7 @@ search_and_reference() could potentially hold reference to an element which
>  has already been deleted from the list/array.  Use atomic_inc_not_zero()
>  in this scenario as follows:
>  
> +CODE LISTING B:
>  1.					2.
>  add()					search_and_reference()
>  {					{
> @@ -79,6 +82,7 @@ search_and_reference() code path.  In such cases, the
>  atomic_dec_and_test() may be moved from delete() to el_free()
>  as follows:
>  
> +CODE LISTING C:
>  1.					2.
>  add()					search_and_reference()
>  {					{
> @@ -114,6 +118,16 @@ element can therefore safely be freed.  This in turn guarantees that if
>  any reader finds the element, that reader may safely acquire a reference
>  without checking the value of the reference counter.
>  
> +A clear advantage of the RCU-based pattern in listing C over the one
> +in listing B is that any call to search_and_reference() that locates
> +a given object will succeed in obtaining a reference to that object,
> +even given a concurrent invocation of delete() for that same object.

This part sounds good to me.

> +Similarly, a call to delete() is not delayed even if there are an
> +arbitrarily large number of calls to search_and_reference() searching
> +for the same object that delete() was invoked on.  Instead, all that is
> +delayed is the eventual invocation of kfree(), which is usually not a
> +problem on modern computer systems, even the small ones.
> +

small nit:
This part is common to both listing B and C right? The delete() is never
delayed due to the search_and_reference in either case, and the kfree is what
is delayed.  My patch was highlighting the difference between the 2
listings, but this text says what is common between both listings.

As such I am Ok with the changes you made, and thanks for this document in
the first place.

thanks,

- Joel



>  In cases where delete() can sleep, synchronize_rcu() can be called from
>  delete(), so that el_free() can be subsumed into delete as follows:
>  
> @@ -130,3 +144,7 @@ delete()
>      	kfree(el);
>      ...
>  }
> +
> +As additional examples in the kernel, the pattern in listing C is used by
> +reference counting of struct pid, while the pattern in listing B is used by
> +struct posix_acl.
> 
