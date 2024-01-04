Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4A52C19B
	for <linux-doc@vger.kernel.org>; Thu,  4 Jan 2024 19:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EdnZzLUC"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-555f581aed9so1029554a12.3
        for <linux-doc@vger.kernel.org>; Thu, 04 Jan 2024 11:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1704396098; x=1705000898; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v4MuqzTE/G+T5VrqGABwUELReNnh9TwctX30WQtzQOw=;
        b=EdnZzLUClgs4ur/8y5FP6tRq02qyWaY5N72vXNV5I9U8bZ/7bKHZvSDwGX01jA1NAz
         Z/8Dmh9QysgWpFAHjEiv5MnGR2GQbMzilbKtSJTGsR7mqwKBGTHr7a88sJ40n+4iPQSr
         xtIwlHn98rsYx9laJRh++951DYO2BbepN1hGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704396098; x=1705000898;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4MuqzTE/G+T5VrqGABwUELReNnh9TwctX30WQtzQOw=;
        b=o1GdzFxCW99bJATIPbaVR2zLoaAxrya4MuM3YjinpMurNBeAWGDsmGuvDcxpXiP5X6
         1kwZr7z1bc2feehaRKxj4Lbl/djdgaRuUGDZL2hsDWDubDeoS+EJnq93xeleOtcJ0B/Y
         ogPBw09xaNGtPN8+8IYzYu/I37UcGk4rQCO3ZGTMf/1WQk5ooHcCLnDRpH8d1fe6r2lA
         vV6CtowNc83Eh/xAxXk+ihrLkKgcXJXfi1GLfSatpjVv7Tf5rdxmJyenSw3N58r63e8W
         73dIX0E15aWD6faAaPShUDBdVNLSpCq3q7jYuy21UXkpu8ZazH/Ae9UdTMnLWx1Ul9FK
         E1jw==
X-Gm-Message-State: AOJu0Yy6wZ6WYcxk1wUOfmLDb1JFSb8tdcl+0gPOjW9KMOtykJbT4XJe
	r95Uk3nC7pFurTIMMmvt0cgLethHXlVAaBWtvbASko3YOlp9hOgG
X-Google-Smtp-Source: AGHT+IEHm7BhYyuStFDO1VUcsZsGvnwVr01EeI6gaLVd/PwUTg1M8SuqZuOf74dRLqI8PKt0hnsOog==
X-Received: by 2002:a50:c30f:0:b0:557:1792:6e95 with SMTP id a15-20020a50c30f000000b0055717926e95mr311366edb.41.1704396098497;
        Thu, 04 Jan 2024 11:21:38 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id v12-20020a50954c000000b0054b53aacd86sm46402eda.65.2024.01.04.11.21.37
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 11:21:37 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a28e31563ebso100323766b.2
        for <linux-doc@vger.kernel.org>; Thu, 04 Jan 2024 11:21:37 -0800 (PST)
X-Received: by 2002:a17:906:ee86:b0:a28:fb5:4389 with SMTP id
 wt6-20020a170906ee8600b00a280fb54389mr705009ejb.0.1704396097273; Thu, 04 Jan
 2024 11:21:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240103203246.115732ec@gandalf.local.home> <20240104014837.GO1674809@ZenIV>
 <20240103212506.41432d12@gandalf.local.home> <20240104043945.GQ1674809@ZenIV>
 <20240104100544.593030e0@gandalf.local.home> <20240104182502.GR1674809@ZenIV> <20240104141017.4cd8451f@gandalf.local.home>
In-Reply-To: <20240104141017.4cd8451f@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 4 Jan 2024 11:21:20 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiLTq-aj2bN_B7-0h2NYdkVxkbkmiOKKer=n0x6pPO77A@mail.gmail.com>
Message-ID: <CAHk-=wiLTq-aj2bN_B7-0h2NYdkVxkbkmiOKKer=n0x6pPO77A@mail.gmail.com>
Subject: Re: [PATCH] tracefs/eventfs: Use root and instance inodes as default ownership
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, LKML <linux-kernel@vger.kernel.org>, 
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Christian Brauner <brauner@kernel.org>, 
	linux-fsdevel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jan 2024 at 11:09, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> My mistake was thinking that the dentry was attached more to the path than
> the inode. But that doesn't seem to be the case. I wasn't sure if there was
> a way to get to a dentry from the inode.

Yeah, so dentry->inode and path->dentry are one-way translations,
because the other way can have multiple different cases.

IOW, a path will specify *one* dentry, and a dentry will specily *one*
inode, but one inode can be associated with multiple dentries, and
there may be other undiscovered dentries that *would* point to it but
aren't even cached right now.

And a single dentry can be part of multiple paths, thanks to bind mounts.

The "inode->i_dentry" list is *not* a way to look up all dentries,
because - as mentioned - there may be potential other paths (and thus
other dentries) that lead to the same inode that just haven't been
looked up yet (or that have already been aged out of the cache).

Of course any *particular* filesystem may not have hard links (so one
inode has only one possible dentry), and you may not have bind mounts,
and it might be one of the virtual filesystems where everything is
always in memory, so none of the above problems are guaranteed to be
the case in any *particular* situation.

But it's all part of why the dcache is actually really subtle. It's
not just the RCU lookup rules and the specialized locking (both
reflock and the rather complicated rules about d_lock ordering), it's
also that whole "yeah, the filesystem only sees a 'dentry', but
because of bind mounts the vfs layer actually does things internally
in terms of 'struct path' in order to be able to then show that single
fiolesystem in multiple places".

Etc etc.

There's a reason Al Viro ends up owning the dcache. Nobody else can
wrap their tiny little minds around it all.

               Linus
