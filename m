Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38821F5821;
	Mon,  4 May 2026 16:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777913897; cv=none; b=JRdSdgDRE5KZVrnNEdsHDRuNUnMmq9gbwMcosf5/B4PwoVTzf9K4++3JDnpUQnwvVwCwPk+T9sLYxGN9SJj6fN/WhkQ3m2eEPve0SwF51ga0Ov4t6rjWaH93D6tU5WrBVIltPjOpo+5iGR9BCnYVpILlOP4TfXqQd/3nZAm6UW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777913897; c=relaxed/simple;
	bh=XhgXUyGfG2nyaluK0MeJ9Ts+z2JPQ05UrF+BAsOzOis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MNIJH/DBFgN1U0tNCB0itR6IhlRG+ODe6Qt1VrBP27pi1IUm+yWpDcTU4bWiimrTV7VRwT2F1I6SShg95+2CCLL0mZRO+thBqUcz3bro08w88x01amaQEno4kJZDmtmos996y6JF3lZdDMrzrQnpEkE3DCTUq0NqRZ4R1BQsxvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DQBcbQWk; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DQBcbQWk"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1EB2169E;
	Mon,  4 May 2026 09:58:09 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2DEE3F763;
	Mon,  4 May 2026 09:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777913895; bh=XhgXUyGfG2nyaluK0MeJ9Ts+z2JPQ05UrF+BAsOzOis=;
	h=From:To:Cc:Subject:Date:From;
	b=DQBcbQWkRpXner/WSIx9wZbSYOCYk7i4K3TCNHhWuUYE9J/zJqLADFOWjV6TEnTay
	 nQhe1uzmCQViGe41wg6qd2MkJaCHzvCvKQ9x1IvKfPulWqwEJlLVu9maIWONgP/rO1
	 tPWsnNUP8wdcw7JKbQv3dC1skMS0zTEoQ5WPSUlE=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: maple-tree@lists.infradead.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH 0/2] Documentation: maple_tree: Improve statements on reserved values
Date: Mon,  4 May 2026 17:57:44 +0100
Message-ID: <20260504165746.1422057-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is another version of [1], where I improved wording.

While using the maple tree and reading its documentation, I found a few
bits confusing, mainly about the reserved values. So here are some
changes hoping to make things clearer.

I am not familiar with the implementation, so if I got something wrong
please let me know.

While looking at the code I also found that although the doc claims the
normal API blocks reserved value stores, the code checks this using
xa_is_advanced(), which only blocks values up to 1026, not up to the max
maple tree reserved value 4094. For this part I am not sure whether the
code needs to be changed or we can also improve the doc.

Any feedback is appreciated, thanks!

[1]: https://lore.kernel.org/linux-mm/20260418204754.120405-1-weilin.chang@arm.com/

Wei-Lin Chang (2):
  Documentation: maple_tree: Point out constraint when using xa_{mk,
    to}_value
  Documentation: maple_tree: Clarify behavior when using reserved values

 Documentation/core-api/maple_tree.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.43.0

