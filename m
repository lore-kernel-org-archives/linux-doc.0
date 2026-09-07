Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED97338838F
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 06:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763538; cv=none; b=W3mfiuqQJnslzCwOBFfuI/xR9pVt49gICuwcO8qz6IUUCrHUeED2/S7LdkgPfFkpidS0hW6cDHGhWzA/ryabtJhNMBJFSYeQ7K8TZYe30btnlVMhI9v4Gi05l80pYifn9Ttei6fJDM0xdm87B3M9dCh0Dd6v1ITbKxtLfc5qGcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763538; c=relaxed/simple;
	bh=Lw08kb+Yi5NRfZz8sddEr2h6szXqfBbP+Va9h6leGXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KFkPPkga3LT+bwyVAV3UZzjZxKwRGQOtj6uxPeu12bjFqQ9Cm0ll9lDPWuvfDc2unNHoJaWoZJ/kFHi79ZDDzu+mVC8tPtxGoXV1w8CS2czdY0fk6O0zIwaXzJgPqpWr29K/YrKgeETApdHLQo0Y+hkrK+qxLPN2jIJ58cw2Wg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sGVETO9P; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sGVETO9P"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso2581576a12.1
        for <linux-doc@vger.kernel.org>; Sun, 06 Sep 2026 23:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763536; x=1789368336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tGB2PSeXN4lh0hUHjCdethGbqU/tWfxT7AmYX0+4CQQ=;
        b=sGVETO9Pcy94hbBV/lSu98SBburfQdI3F368ejNrm7znJG8vkU4zYqTEN3r6mdbibH
         XbfqmvjgXpEiPLPX9uAJj6oxVhLNlJGrvcY5sJUKViU+P6KfzPBCu1IBk6L1+Owr48pt
         RWcemShkoI0WPbRtIxOyMlzaE35PjFDX0D+HdGGCYmMA5nfX1Tk2XjJSAeG1OoEAHTIU
         iiDOv2CC+1VITk6FaIVKzfsRD/FJmMjpk3GoBiSAZFanhT7hed1pSRDLYc/egFf63B5d
         kekVNYoPT+NmYGPrryW5mAfucTBCW+URXYFgAqR7p0pmPq8WIuKl6jFQlbKhwsSAnDxd
         Cv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763536; x=1789368336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGB2PSeXN4lh0hUHjCdethGbqU/tWfxT7AmYX0+4CQQ=;
        b=fwIY0xzCqTR8erK5yftvhaE3poBVHmu/d658On8Hh1cmA4smQ+DShBpTcdtmvBz+rF
         NPkcj/Gc6+Z9Xsyh0ZK0OzJtb1suaBv910mjmAHsLKbPeuuCbFwYhgggJM+JvghChhOG
         is2eWby7fMgK88Srba2CZEFwyW7qmcbzIRL1ECdWyIEtn9ltFv3+bqfCbdDIPD0/pzJg
         VElxadHJNxlgWpC4FR+8IOmqYV32g9jHCuywTA95jp0buTuwnceHTOmtjwNC2PwNtcPa
         oj3Cd+IFScf/uRivVvjyV8hkkKLBznpwRd5tS/EOHyy0qgy/wHqxzZUtOFQ6y48qAcMj
         GTLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwprS9KjJKuoobqMkr3k6qSmPVzS7JMY6lwEtJIbCnGC+ibwnhdJZbV/k3mmP6qMcO8goHiG0Y6Eg0=@vger.kernel.org
X-Gm-Message-State: AFuF++mQ1PAehazfYPK8JbznXywesIojf6D8yDmcQxtt+uekekg/AwKU
	tE7CmyQfe941zJZMUV72J8dJIR523y9/QRG+wEBPRtWjVZCusvFYBDIV
X-Gm-Gg: AYBFou2ucU5Et20ahuM1MusKBrio1eqNfkDN88GBa2GsqEK+gOfGoX938jXjny8JhK1
	wHnOKQHJO0GsQOJNp6K3gXFrBmAUKSZIuc2x4FjunjlTehPYvE85NOEo1ci2JI9FcGVz4m+kJ+o
	fbGw70ut2fIwIy+u0oWpB/n9r6pzKdjsRa6PkjfZaqKU1dOsGHDwZIaa/6Jib4PVnmr9jANS7tr
	jw8+8SSFaPNvKeplZynYQY339lMNzVx/35jigjDX8zaCoAPo6BAyPnk5MXqkrbqwYnZLThgSiDz
	CULYmdFaV9KrOcly07/2oVabCRx9M4tp3cTbL2KMdXiay99VyYBHeti/JbUS4g/iDGtVbaZQ8iN
	jF2nAzMwQo8IQI4wNIUFGjetXO01ny4rJIzzz/h4KwxxmS0mLzPCfmcDiWDwjChWavMFnqRrGOU
	xpzDzW8TVIENXUweotw3QJYoz6ChMSERIhK6FNf/U1cweP06DWbWnuzhQGUT0HQPt4W01V3+4iB
	gxUuFAJ83tQEQ==
X-Received: by 2002:a05:6a21:7484:b0:3c3:8d86:9855 with SMTP id adf61e73a8af0-3da39bd47eamr40391539637.7.1788763536223;
        Sun, 06 Sep 2026 23:45:36 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm17209594c88.8.2026.09.06.23.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:45:35 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 0/2] net: fix typos and repeated words in comments
Date: Mon,  7 Sep 2026 12:15:26 +0530
Message-ID: <20260907064528.6602-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (2):
  net: intel: fix typos in comments
  Documentation/networking: fix repeated words in comments

 Documentation/networking/device_drivers/ethernet/intel/i40e.rst | 2 +-
 Documentation/networking/device_drivers/ethernet/intel/iavf.rst | 2 +-
 drivers/net/ethernet/intel/i40e/i40e_common.c                   | 2 +-
 drivers/net/ethernet/intel/i40e/i40e_ethtool.c                  | 2 +-
 drivers/net/ethernet/intel/ice/ice.h                            | 2 +-
 drivers/net/ethernet/intel/ice/ice_main.c                       | 2 +-
 drivers/net/ethernet/intel/ice/ice_sriov.c                      | 2 +-
 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c               | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.48.1

