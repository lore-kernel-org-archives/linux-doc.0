Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D567288D6
	for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 15:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767108066; cv=none; b=djvy3oupQTKEnExwg7SGpMFk9W9osVtqTE8vmsqWwCSTIjJaNdLgtUxVAuSIawjYJQ4svmJwafsE/iBckgZ5YLpl0bniHriem2tgOqcehJ0JYb+w0j5EcPU1gIdUiYvLlAdxZ69rFtubbWwu5PGrIq85cdUcft5beip7FSKiHOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767108066; c=relaxed/simple;
	bh=UqefMjhSVqeqxZ7cw9SZ3XXPaID45kiWVvBSiFES5nw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=j+Jx3WP63/RZt8SR6MIuZP5u0Qvy76QpA0QrsQuoM4MbI2wvhH2uOXRHQ2vV1kbHvkaDYY3V2lfYZZgzV7OlfQDdBfwpDg4SGOgG4CHXXwMcyaQMwFzJWZ+3hS/zlI0ofWxL9FYgvJveLIng3+sYl3AMyJ0uhrDwMQdvbAbZHBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-65747f4376bso19247595eaf.2
        for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 07:21:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767108063; x=1767712863;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2mGAIhaLqmqueebz091ruC6N1hhdYb289JyV9x3owoM=;
        b=X59ZHf8QsMSqwIUjuhOzO7S8TtbJM/jJcGX/huqXDvjZLyGfHLX6kYVYD5vLNQFI4h
         MlIYB70OfSrgHkUjYpi36I2oIg8cmZWRvf1PmG49lFGrP6cs49N2HiFCNHS7Q90cjcdx
         +TmHyzFv5qCxlpVgdLseWPGx9h97n5rBsiQe5oN0erpjblTL9mVhBB9Ti9Pqby2L/5oj
         PuI79DsSAkQ0nT2D02/Tlp42dIZl+gg09iQ7cS5qRM+krw7ruXeRpH8jz3esP9ltXX0p
         c/BQfvHsKux/Oy1DmlYGzGjSn4YJzZZYfF3n7b3UXQ0L07VIwE8UQGPSFUftgoDGFo8T
         jj9g==
X-Forwarded-Encrypted: i=1; AJvYcCW5CqNZ16KZZUKWB99AJMIiPbRcsW8Go1BiJY7rxidFOsbw4qcAFKA9OAFbKG2ISzYqqHDLApxfDXY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjtNMLH8lDXQPOimgRkccKgbf/4nAiCV9FeEJNlqPOECaN0pkX
	KndftoL6olw5omC6Uy3bdOnGfYOdHBsX2xsYUNc0MiIXMgp5e98nqR1VV68juxqGsy7o9U80IHG
	S81GGeCpYrX+de5Idf3jtFcc9ivLJZ3p8H040I+oBckFQ2E9l0uF0q+WMuWw=
X-Google-Smtp-Source: AGHT+IHkKUH30RxqdCakjTYB1Y4xBbuTNTd0OXa/1EH11X4dbUPXfPlYah/opolSsQ87AVuh34brTp8VvzOuaj9iGfTQpVdHJrW1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e1c9:0:b0:65c:fb86:8a94 with SMTP id
 006d021491bc7-65d0eaa2672mr11026884eaf.36.1767108063158; Tue, 30 Dec 2025
 07:21:03 -0800 (PST)
Date: Tue, 30 Dec 2025 07:21:03 -0800
In-Reply-To: <686ea951.050a0220.385921.0015.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6953eddf.050a0220.a1b6.02ff.GAE@google.com>
Subject: Re: [syzbot] [xfs?] INFO: task hung in xfs_file_fsync
From: syzbot <syzbot+9bc8c0586b39708784d9@syzkaller.appspotmail.com>
To: anna.luese@v-bien.de, cem@kernel.org, cmaiolino@redhat.com, corbet@lwn.net, 
	davem@davemloft.net, dchinner@redhat.com, djwong@kernel.org, 
	edumazet@google.com, horms@kernel.org, jhs@mojatatu.com, jiri@resnulli.us, 
	john.ogness@linutronix.de, kuba@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, pmladek@suse.com, 
	rostedt@goodmis.org, senozhatsky@chromium.org, 
	syzkaller-bugs@googlegroups.com, xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit b9a176e54162f890aaf50ac8a467d725ed2f00df
Author: Darrick J. Wong <djwong@kernel.org>
Date:   Tue Sep 2 21:33:53 2025 +0000

    xfs: remove deprecated mount options

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1481829a580000
start commit:   d006330be3f7 Merge tag 'sound-6.16-rc6' of git://git.kerne..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=b309c907eaab29da
dashboard link: https://syzkaller.appspot.com/bug?extid=9bc8c0586b39708784d9
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15e24a8c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10ed3582580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: xfs: remove deprecated mount options

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
