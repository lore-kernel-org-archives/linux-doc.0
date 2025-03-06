Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE68220297F
	for <linux-doc@vger.kernel.org>; Thu,  6 Mar 2025 09:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741251846; cv=none; b=l0zmIDuctDsXBbe/gtR94i6I/nStPEnjCrgaCBLkrwJkCpmgAQQwk0Trikp6R998JZLb0tjTlIheyiMCig8y4PiOrkYHKE6raS5xkEjE1n9j6DcMEJqfRKQRex1Gs8sOsdaNEv1nYW6MkJw6RrFQTEXmKMndOCAK55IPhY9i0g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741251846; c=relaxed/simple;
	bh=ruAfKKuJv4D//haITjZ4loefKlVdbyEM29MI7QA1oWg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=oViZGK1HNcOx33YVyw/bZKWBoBopg92SGXVIDWZPo+sQUdAu8fZDBLgmoxZ5rM6KoLKQA970nZ9mDvBoC3ZbXCUOFgIHGRgSf+9t+FULDN/BiIzMflpWsRJ0GkdpG70ydA2HDIc9uJQZzQDdpnWKr3eqGj3h8XOuL2eVl3ybrKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d2b3a2f2d4so8007925ab.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Mar 2025 01:04:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741251844; x=1741856644;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6PlUf2EDtc8+GWdOxIDmfUU+aGd5sbW4hhN7UakkYqw=;
        b=jbzEt4H/3Jvgrkr2pf15EjWQET7jh+18cJRhxdvSszUaILnjl4opj0lwqHNZetZ2ng
         Hv8tcDUhiUluqtWfZAufl2jHW7/52CQyusbVDJJMJgsQbLriQc+G5g2ewR41SYZUTtbL
         rGDIVynMTsBmu0a2CP3D/1sAcVeuY3D+2GEaOHaWPWD7riRi9DdBD7UVVG7VR/SK2T6H
         A2u5pcLsibR6/cpktNn0/18zdBFOrTGXN/p1oTcXruUr5S4E3YnrAVgSYRXL9N69nCVA
         ncEfwkNqA3HKUdCV0iGoxp5ZoNJ8MpaaURr9ku5RrRLgNXjQUVOydixJHUlftkt+bpho
         7RfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyXM8goIbW4cCxQPWTrq6oPzcydK9gkIbgC5x5ORTuRmf0nTUMqoCmS4HT7wNSud5SlT54CMbum4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD6H2qc8yDEmYCFC+EWuryJezndDxHAWtSR5OxzR80lJXfnqrE
	gEG/4MrOg8qyM4q8nnxHKasYUHITYJFH8c3xaKtSAqxq/6wAxL8CNwU+owbbDhNrFtVLKfBBVhN
	yslWmuZRlhCuTHDW9dTp3v+fMeFsN8ujkFpEUr+f2rzg5g20DDYwiYv0=
X-Google-Smtp-Source: AGHT+IGTBLARltXQf7oengpyI6p3Xjnj/feG2ACDCutrMgIXebFL36ZwMXTWYi4jeppRR1zG6cu4U/sqPkb1QpRrtRzIkxgmvrIo
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:190e:b0:3d3:e09d:2a9f with SMTP id
 e9e14a558f8ab-3d42b891005mr83529435ab.8.1741251843985; Thu, 06 Mar 2025
 01:04:03 -0800 (PST)
Date: Thu, 06 Mar 2025 01:04:03 -0800
In-Reply-To: <67a11d8a.050a0220.163cdc.0051.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67c96503.050a0220.15b4b9.0030.GAE@google.com>
Subject: Re: [syzbot] [udf?] general protection fault in d_splice_alias
From: syzbot <syzbot+a9c0867e4d1dd0c7ab19@syzkaller.appspotmail.com>
To: amir73il@gmail.com, asmadeus@codewreck.org, brauner@kernel.org, 
	corbet@lwn.net, eadavis@qq.com, ericvh@kernel.org, jack@suse.com, 
	jack@suse.cz, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux_oss@crudebyte.com, lucho@ionkov.net, 
	mjguzik@gmail.com, syzkaller-bugs@googlegroups.com, v9fs@lists.linux.dev, 
	viro@zeniv.linux.org.uk, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 902e09c8acde117b00369521f54df817a983d4ab
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Mon Feb 3 21:16:09 2025 +0000

    fix braino in "9p: fix ->rename_sem exclusion"

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11d77078580000
start commit:   69e858e0b8b2 Merge tag 'uml-for-linus-6.14-rc1' of git://g..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=d1a6d4df5fcc342f
dashboard link: https://syzkaller.appspot.com/bug?extid=a9c0867e4d1dd0c7ab19
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=125d0eb0580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13a595f8580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fix braino in "9p: fix ->rename_sem exclusion"

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
