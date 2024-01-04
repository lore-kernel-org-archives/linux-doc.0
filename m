Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32C62C682
	for <linux-doc@vger.kernel.org>; Thu,  4 Jan 2024 20:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ArNoynBd"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40d899205c7so7477825e9.2
        for <linux-doc@vger.kernel.org>; Thu, 04 Jan 2024 12:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1704398540; x=1705003340; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9jDsDfmbTpiQpvGnfOhd0ROcnisF14caf1vpRK9xqg4=;
        b=ArNoynBdhnj+vTa2/qkzH3091T9PQDnF8kxq5ye/nanLTuq6BfZC3Z3KgCSNg7KsUh
         Q3ibRBR209om4+k3U2gSSsRPkzcGqjRI3DhE6t5kKRb8jzYY0SpsgM5oK69kwZOpF/J1
         +BoFAfSi7Apii52MQevqywR4slJAWAJv2/YMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704398540; x=1705003340;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jDsDfmbTpiQpvGnfOhd0ROcnisF14caf1vpRK9xqg4=;
        b=uTEL/1oeNbaawRjQRNQJg/5gz2YMPPAIrqilWNwwdDBFkgZQxDD+ZVRMGTP2KsdxaB
         hclXACK9+fq2OCDBroMFdFcKdtTNl/0Qn32aRMaX2vyTvHQn0lytabxkMeywirXbgp5n
         QCCW8lxsSS1HJBaXojAMb02KDQzPKyrAM3Tqbpd7G8FfFFciry8yZM4hN5H/WoQSII8O
         jZKd05F61+HFSwNsmf+hgjAdZiE2IH2BNuBW0niEbdudGHeNBX1yNQASxiuz7aMZljzg
         e4o6Hy0rosod+tzZwtwpE6X9c1FfhOVzy6pEJkiW/TZHVOww2jT82E+ddeujnhKTxax1
         C0Gw==
X-Gm-Message-State: AOJu0Ywp1OiliUeg56lmP4KTvi+8r4RCbYW9yXELJRgsn3qV8Gao2hIU
	w80td6J3uDdyOVj3Ep0uJ4bra8M/wQqTfH7fYAYbEj4TGldb+m6W
X-Google-Smtp-Source: AGHT+IGWnA7bmvCvcQhjfWX0EyXVjsHvyT1sN2FaODN+BaABT24Ruy/ofalLn6PT/QhY6FUsiXGpLg==
X-Received: by 2002:a05:600c:5115:b0:40d:b191:fd with SMTP id o21-20020a05600c511500b0040db19100fdmr640887wms.13.1704398539745;
        Thu, 04 Jan 2024 12:02:19 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id g13-20020a17090669cd00b00a274f3396a0sm17859ejs.145.2024.01.04.12.02.18
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 12:02:19 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a27cd5850d6so98247266b.1
        for <linux-doc@vger.kernel.org>; Thu, 04 Jan 2024 12:02:18 -0800 (PST)
X-Received: by 2002:a17:907:360b:b0:a1d:932f:9098 with SMTP id
 bk11-20020a170907360b00b00a1d932f9098mr716728ejc.97.1704398537679; Thu, 04
 Jan 2024 12:02:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240103203246.115732ec@gandalf.local.home> <20240104014837.GO1674809@ZenIV>
 <20240103212506.41432d12@gandalf.local.home> <20240104043945.GQ1674809@ZenIV>
 <20240104100544.593030e0@gandalf.local.home> <20240104182502.GR1674809@ZenIV>
 <20240104141517.0657b9d1@gandalf.local.home> <CAHk-=wgxhmMcVGvyxTxvjeBaenOmG8t_Erahj16-68whbvh-Ug@mail.gmail.com>
In-Reply-To: <CAHk-=wgxhmMcVGvyxTxvjeBaenOmG8t_Erahj16-68whbvh-Ug@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 4 Jan 2024 12:02:00 -0800
X-Gmail-Original-Message-ID: <CAHk-=wguvq7yFt3qaLrWoZK5FCK8Joizrb2wu=FN==mYM9PSbg@mail.gmail.com>
Message-ID: <CAHk-=wguvq7yFt3qaLrWoZK5FCK8Joizrb2wu=FN==mYM9PSbg@mail.gmail.com>
Subject: Re: [PATCH] tracefs/eventfs: Use root and instance inodes as default ownership
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, LKML <linux-kernel@vger.kernel.org>, 
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Christian Brauner <brauner@kernel.org>, 
	linux-fsdevel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jan 2024 at 11:35, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>>
> Which is *NOT* the inode, because the 'struct file' has other things
> in it (the file position, the permissions that were used at open time
> etc, close-on-exec state etc etc).

That close-on-exec thing was a particularly bad example of things that
are in the 'struct file', because it's in fact the only thing that
*isn't* in 'struct file' and is associated directly with the 'int fd'.

But hopefully the intent was clear despite me picking a particularly
bad example.

            Linus
