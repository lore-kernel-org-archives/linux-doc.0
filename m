Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C240A38C43D
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 08:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776154090; cv=none; b=mi20w00c0/0lusdHcUHRMOCzq3r5BVKSb2Is6EEtxYtDfADrtOC0KmY3dT5tkUPyjdIcBeqaGUlAyYReyATU8BhDQ6a75cAczcBeUBEr+zwgR6Hkln6MzkUd2ZI70xwqILlZvlpnPZtredwVUjigSxCB/cKcxcfYbZDbpa3BwHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776154090; c=relaxed/simple;
	bh=NCU7HC1t3iEDC4IqX2izve0FBoiDBcxRNyhBdT9YCoc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=sK7/tvRRY0GyIsVjatPO1GAvf7xWZdnZfYe+A3jVYQUvAJfzd2G2VbHsbvgAgQK9PS2EVFh6m+gzSKf17Lc9mhTKVYXSkbjC4L0SKzm1H0Tf1FuB8SvGRNCQspBihylr/yEGSrN/Yy62HgPgvHF89aS/bK9/S040pg+zXBQInIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7dbe11b1f03so1354217a34.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 01:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776154088; x=1776758888;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NCU7HC1t3iEDC4IqX2izve0FBoiDBcxRNyhBdT9YCoc=;
        b=AEG7MjThBcSk0L/dtv5kK2r47oOPHo0ZnkD8WftfSEue8BvoaUHQQwq7ojwRo/CXwM
         lLCeGu5krh2v6rmUx0n+iNc+WMh3ORMspbk1OdZXF6TWvL+zSW3DkSRFQwy0mcssbNyA
         E4TVoX4gzMyrbVg0lFjonzPPaou0HqtaRZMTJUOP8US1XLXwm3MxOoH+q2fSMaxhSBh8
         BTakiOe/ac6GP1czlZ9Gu8VXwr+YZte0Z6o4PEDFImZ8AP+bO5DUOleasetmfTj2ndhB
         hmvO445Zm3/nqOOwbVg/BhPFrCVjunbbofAElHlPMCfsrzcz2n1v2OkwDTbPD1Uri1fj
         fg4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/AoMwKMdxZ3Gar0380LsXNXRLvmk+wcV89oL+cK02Oe4TT/10PJDr9ombwnz+n3Ep4LJ55rLaYcc4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4dzCWSriEFEIxOo7/zEkvc3HNRtkleDSHIO6bbNYgsi2VZKFc
	O8cNTxk+Rb9FzJYaI/3e/CuPi2cug/nFSNwkR1uEh80C9p7gJsoVDKBQ+oT8YFkPe7ZZHOrx2GO
	G4ZlYoSg4RtEvW25sybnzmgcvkPHU1a/IjE0u8qtUAfefFwJBYnqB/nf9r1Y=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:8183:b0:67e:1c67:ebd8 with SMTP id
 006d021491bc7-68be7ee1b88mr7508599eaf.40.1776154087806; Tue, 14 Apr 2026
 01:08:07 -0700 (PDT)
Date: Tue, 14 Apr 2026 01:08:07 -0700
In-Reply-To: <41689f2e-8786-49a6-912d-f65e48245a61@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69ddf5e7.a00a0220.468cb.005b.GAE@google.com>
Subject: Re: Re: [syzbot ci] Re: veth: add Byte Queue Limits (BQL) support
From: syzbot ci <syzbot@syzkaller.appspotmail.com>
To: hawk@kernel.org
Cc: andrew@lunn.ch, ast@kernel.org, bpf@vger.kernel.org, corbet@lwn.net, 
	daniel@iogearbox.net, davem@davemloft.net, edumazet@google.com, 
	frederic@kernel.org, hawk@kernel.org, horms@kernel.org, 
	j.koeppeler@tu-berlin.de, john.fastabend@gmail.com, 
	kernel-team@cloudflare.com, kuba@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, sdf@fomichev.me, shuah@kernel.org, 
	syzbot@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"


Please attach the patch to act upon.

