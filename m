Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845913;
	b=rs7fPjl1l/SbHcaUpoviTDoX89f69k8E8TPRk0T/mCD2jXUKajmuoC1JvOdZAV1pVDVo
	 wUIVNLMRFPIBXfvC62wsGDUltSMFQabSnlaoVcirWZ0i/81dcPLZpKde99j+qYovMYC1V
	 9xHCDXbERQF8GJxjSTGNLnMWeFXhtwJuBjhJK9cgVjAAfC+HocH5JcmS/Bgt3yXzOO7Oc
	 BqGVCSI/vj3fCMrsQyg7WFbQqeLxuxh7gx8VjjAcld7lg0FHBzJjWZ6QnFsN9MMtGdP2O
	 knKzGaagQ9bXiN2M3W4BpBx81x3KvEjr8NO2PA70Ay2B+TDx981SlTdtYnID86q86Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BBLE+9+yWyusDlKB+5tR9LXP9RfzUs5nseTcOEGR6aA=;
	b=Kcn4vZOC6F/vqqm8pBpJ+eHxBsEbUoWvn2Jxe2WXsstgHw2B5ggVju4sBCYELzud+p8d
	 iIPrxJWm3B+8Xbe4jtilC5MDh986wS6t7oLc0XhXlG5osz+EOwvS4dGFzuU8iiSfvH52R
	 1Nio7Z28hunUbfuOECHGNVWH/UoZ0nmSpkbIiEWZ40FE8nJ1VF+E5JeoUUUsMYCu6VUx3
	 cUVqcB37M6Wd2Nzwj33tAFPcTD5sWpMJShZai9rDIK/dRQaCOIdqvs2SwFKcGuz/kiOcm
	 W9XUmPfHUyTBJagwkc7YXk0KLXhqjCggzHzVNgrTc8eG+waWqOtPGP6CWmpC5vUqJNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8B3606A31B
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 02:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F8B3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc147d86bebso108747a12.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 18:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793845908; x=1794450708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BBLE+9+yWyusDlKB+5tR9LXP9RfzUs5nseTcOEGR6aA=;
        b=W1uRJF8nLsskKCC9Sg/ntZF545260DD8MqgSCGv/bc4dH6kHep9TC5ZoVTnihtDSyc
         yGYFawblVARJ6stVtvmdK7xMb52AIUOSnSwN115Ay7gzKjUysbPso+qukQn2SCvOJE2J
         hpz23KBOpPLJyWnd59iZiOt8cDluB2V5GUtPp9+lAf5RnlrV6bpry4y/tavhIQ8r53KH
         h8JQpmDZVES8wGp3vYavgdvkEppfgsBIAp/so5+qcjBLbkClu7cnJlwXG5+0bVXb77lc
         9AHa2IIKtGDEg/r1FjS3xl5SvDWReHc6ZhVozA9ymbcxWqG1sQh1DMYU8OrAHXP+rsw3
         VCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793845908; x=1794450708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BBLE+9+yWyusDlKB+5tR9LXP9RfzUs5nseTcOEGR6aA=;
        b=ZD9if6cU11xwe2EgUhDEHT2+Kc9GPm3BopMUNm1NlcjvkJDBBLdyTUbWpLdRl6oKBU
         t8VKqChTh9T9D0Cbyz1V6MoAdafS7mqbrUFjujaG9K1enaQluftpGLoj8gPnPoDs5x0r
         4NBiirwhGuxi+NeATgHL3iaBJ1zF7mnTthWS42d4d4tc5imOs90zkNDRdflbsrjkCNln
         FYH7Dj7mm8kAUsk6t0gwImM4nttS95U28OXi1uYV2eFZLKa1G6LBcaMKgsfgH4q3KVY5
         9b6KMfxcnhBB6nB518YGCNjuAEWRUEwI1aLJDzfQ/rpuiBRbUw1UQTIw5xD+8x7IKnb4
         Vr3g==
X-Forwarded-Encrypted: i=1; AKwUvBwWaPfXy1fymQYEBiwuf4waaHitCZfgUBBrREG07QtlbNkPJVyM8rDVorylARer/ijNcPzZnhA/DsA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BHzOlTkCkF1lgvDRLu6C7hM9CfFqgnOGPUUjZwyi+gpNBGF6h
	El3smsGICyHG86L7WhonjDgH4HrRoipndBSiQYVJ00urZ3v9zl4ORViJDOs39A==
X-Gm-Gg: AYBFou3UyIGmDIOXVeIWljXRugBy2JvvZp1vAUN9TZEEL1Bf5IWrH+nVpt0ovEO3YZ8
	WUCF0smXMs01qNcMeKJLxZSt9a4D86jRCCDK1R5dn4mcC/B0MuJD26IK3d5+L0sbFajZvyDVTCu
	pvqMCucp9d9tclxIn8uYeziFtw8KNSMgwGMu3+F1kD32jwVk7dIaGphM7LXEYLDuqAu7XvkOFIJ
	/Hs1CohRsQpzKWVX88k71jA23nYOxLfkCVIEEvKGkYyEtu5b0vmGFRyfBaovIO9GfKpXYFAdZvF
	53/bhZR5LspKE0CRBohod7kyB7wJX3HNuA7yH8qCcwKsj70QuSgKpr5xOwUVY7xL3Vv97Dcpbjd
	CFuI7yP0HxVvFsPp1iKgP9Hy8FXWCbeQc0zaHxkJpG1rB47soGPxJ/PzOhuGOf1u0l7PYbEUB0+
	kygIiiulOhDLm0APPlK/DFIT5ozpBnxe9K87QIsMM3eGd9+CPzOhX1pC9+nCVHn0KC15NYrSj27
	G/EJabj0M9HQXghq0zDVWyHdDSM39F52YGhpbRjcuis+Tt/WbPykjp2YQdG1U0IwOZB3RjfY7iP
	tB3Fs1dviopphH4WYstMmuXkX70doIXKNHY8HO9Gojoa4Bw0n778aeQzsGPOmXIbKNUXAz1A31+
	xiFkqqB6l8bsLBBq/uik/xQ+oBSwy2JtOsKmOfCVVRs1U2Ts=
X-Received: by 2002:a17:90b:1c08:b0:3b0:9409:6970 with SMTP id 98e67ed59e1d1-3b0afe01674mr954771a91.26.1793845907457;
        Wed, 04 Nov 2026 18:31:47 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm1292775a91.3.2026.11.04.18.31.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 18:31:46 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v16 00/12] ALSA: virtio: fix capture lifetime and accounting
Date: Thu,  5 Nov 2026 11:31:28 +0900
Message-ID: <20261105023140.18373-1-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Takashi,

This revision addresses the two Sashiko findings on v15. The series keeps
its twelve-patch layout and the same base, a4311e9447bbb219044db38897f95be112f46a8a.

In patch 7, ordinary capture completions must match the next physical
ring slice before advancing the pointer. An empty STOP response retires
ownership without advancing it. A gap or out-of-order full completion
reports XRUN, and later completions only retire ownership. This path does
not reorder completions. Valid prefixes, empty tails and ring wrap remain
supported.

In patch 10, staged pointer and ACK callbacks require a prepared capture
epoch. DRAINING alone no longer permits access after RELEASE. The explicit
PAUSED/RELEASED pause-restart case remains supported.

I reproduced both problems and checked the fixes under ARM64 QEMU with
KASAN and lockdep. The completion tests cover seven cases at patch 7 and
the final stage, using real returned descriptors with test-only ordering
and status injection. The ACK test uses raw userspace SYNC_PTR calls in
the post-sync_stop window and after an injected prepare cancellation.
The pointer callback check is synthetic: ALSA HWSYNC skips that callback
for capture DRAINING. Prepared drain tails and paused/released access
still pass.

The six changed stages build with W=1. Stages 1-6 are unchanged from v15.
The combined build also passed 70-second RW and MMAP capture, RESET and
reopen tests in ordinary and staged modes. All fourteen captured segments
matched the QEMU sequence oracle. A separate v15 comparison confirmed
that staged paused RESET already discarded the old partial tail; this
revision makes no new claim about preserving that tail.

These runs did not exercise physical VZ devices, NOMMU or KCSAN. The new
reproduction fixtures are local and have not been uploaded yet.

Previous version:
https://lore.kernel.org/linux-sound/20261105000915.15177-1-mynameisjune111@gmail.com/

AI assistance was used for analysis, implementation and test preparation.
Assisted-by: LLM

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
