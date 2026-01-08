Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77792242D79
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 16:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767888840; cv=none; b=CnJADxlXdiP1b0OAblq/KjNN7XZnkBZQ+zkdouRuVrwbgmVTBT++T+y25FSuhKO+wr24NhuCWniE+a5N35SU3bzakKSZxwsUs0FhuLMD3o6q8J6E59eQpqZ4Llkh1hFl6Xo43zPRl772H2BrpX5vdLyM8IMNCbMtr23xLUFbZfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767888840; c=relaxed/simple;
	bh=pfAEOHBnyjiXFEQwRPHC5G8VZWAFvQre8RRODkn9+q0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=SuJLJ6l8gxCqHqvKpnULfvcWJLkPJ7Yg5WR2E+Nd5J504tpiLxCUyOYcc8Mm49Di1gcwrbFKQr5wwX+pVuwXOCxYDaCtTopbGssKlM/kFLnhkAbAvtmbPkTE9SLcMbISNUexCGFAYSSxjvzJjgZCuiiNcV0esjqv4T6edxi3KB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YEXwzTgB; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YEXwzTgB"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fb03c3cf2so1814286f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 08:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767888836; x=1768493636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/VGGRnLC/Lr7Ss9oUphA/cRoNvZ0xmHMzdG2j/UIxqQ=;
        b=YEXwzTgBwHmGH/c1MSlMzVijZZnJBXBtW1t5boU3B2AESQbYlWSfildR/O2ZmuYrjQ
         m3pb6RcxCeEU46hRzeaZeZD+gnEbgEIu2NUsK2cpPQ9w4pD20cms0jBkj58c66r3g+co
         FHvdWuWEjvYZBj2pUC2fXuRtqGmynAAQG5E+PfEsILXh6ked45j9Ek2U7gt/Y3+NdpHj
         RD22CsvKbXiOaIpsJ3NpAw06gYAwxGwC5ik1Twkh95va2ubUB0Xu87agUU5FOqg/U5/4
         LL9lY0Lw7sqGoxmtB/OzTmLaZ3evUpz1g2MeRIpsrwYhn+bGzgUfP0rOhrHkJRwgPNWz
         q6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767888836; x=1768493636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/VGGRnLC/Lr7Ss9oUphA/cRoNvZ0xmHMzdG2j/UIxqQ=;
        b=GuZTpHgpOU9Zln70aguXq9M6s77j3m9kbipQdSH/m7AmW63aBl2IUUM36WA1Z8hQXs
         WYvALZ4C5iZO1jwAl4b845kLH0i9A/JB+OAQsxKvd+ZSpzRj6VJ1ukrPPzFYOsHAD1+L
         1htZ//7Emsh4e/gMXLcfD0O3h+SyNOHJJIC1Vlorzv6WDyPYbhHS5TVqKz0kE40DJVPw
         WUFcMrI1fF7gvSEDQfscNwpngHeo7NlVC6U2x3r6UZPIYtog0j8uHwd0WjlhdCKbe1Y6
         UGE9r/8hAYfRQHjWG5Si+6s50RGtwET3jI/07aKpSocnLDv03DYbz3P/hVwcyQ1sF7kq
         FVYw==
X-Forwarded-Encrypted: i=1; AJvYcCU9hQ7TYVfT8f7LuOE3KZo4XxQeCrfupf1k9Qy8yuATfS+ULlO/6DYTtO0iemP7Mm0GX/WUnzUuEWA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+h9fs3uxsGntElSi6HatjIKeTW1+IIy0Iqqh32pzFkGUY7HDn
	QNFUOoSTaox0GSLYjJt0Rr3Em7yvH2CzlUYjcy3d/RGrBE1ybh75IL6O
X-Gm-Gg: AY/fxX6zOYS7vp8wVa3NwT5Xj34Qa1r9RT1Wob8CfVo2C+8M9VExZ8tAwGgA3AhS5YJ
	8+hXI055e63LCCIEMoEoetcuAuDk96hopVDL92n3QUFNKqcpBrYguQXTofrDb7mOCB8fT2T8meL
	sX1O2O9lBkng5uqfOtMP/9akl8CzmnWwxON15bN9bAA2n81zuETuImrKAnKhKKrVyMIAcqe51Bc
	2PcJ90iZZe/zmpHnemY8plOIgKxAPWyDZFC9hh1nk3rQ92I+4du9rKoKejMy6OQ4mOvjrbo7obd
	Fvmvp4uuuDFXUJT+eRqMD93PLsPDKcP6ya5Gsfz05rfLcRG3jB1BjVcpydbo4jKereaX0ckBo/M
	aZ/NZxn+oxPhnRZdWvNEZarC5/agQ/jbU1NJxIUte06f6Dsd6lLn35dRcAiJ/6X5KBlE9LjN7gY
	9UZowpja1h2+vtYb7cjjTXVf0prSkI
X-Google-Smtp-Source: AGHT+IH0O2YwmBD8Gu7R9D3URmNXYoiVElbVWRS+klDJYvcMlMiQcrcofvkDstlbzoLJHl9Q6TIy1A==
X-Received: by 2002:a05:6000:40e1:b0:431:488:b9bc with SMTP id ffacd0b85a97d-432c3629b8emr7985479f8f.10.1767888831873;
        Thu, 08 Jan 2026 08:13:51 -0800 (PST)
Received: from imac.lan ([2a02:8010:60a0:0:8115:84ef:f979:bd53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edd51sm17140039f8f.29.2026.01.08.08.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 08:13:49 -0800 (PST)
From: Donald Hunter <donald.hunter@gmail.com>
To: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	"Matthieu Baerts (NGI0)" <matttbe@kernel.org>,
	Gal Pressman <gal@nvidia.com>,
	Jan Stancek <jstancek@redhat.com>,
	Hangbin Liu <liuhangbin@gmail.com>,
	Nimrod Oren <noren@nvidia.com>,
	netdev@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	=?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Ruben Wauters <rubenru09@aol.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH net-next v2 00/13] tools: ynl: clean up pylint issues
Date: Thu,  8 Jan 2026 16:13:26 +0000
Message-ID: <20260108161339.29166-1-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pylint tools/net/ynl/pyynl reports >850 issues, with a rating of
8.59/10. It's hard to spot new issues or genuine code smells in all that
noise.

Fix the easily fixable issues and suppress the noisy warnings.

  pylint tools/net/ynl/pyynl
  ************* Module pyynl.ethtool
  tools/net/ynl/pyynl/ethtool.py:159:5: W0511: TODO: --show-tunnels        tunnel-info-get (fixme)
  tools/net/ynl/pyynl/ethtool.py:160:5: W0511: TODO: --show-module         module-get (fixme)
  tools/net/ynl/pyynl/ethtool.py:161:5: W0511: TODO: --get-plca-cfg        plca-get (fixme)
  tools/net/ynl/pyynl/ethtool.py:162:5: W0511: TODO: --get-plca-status     plca-get-status (fixme)
  tools/net/ynl/pyynl/ethtool.py:163:5: W0511: TODO: --show-mm             mm-get (fixme)
  tools/net/ynl/pyynl/ethtool.py:164:5: W0511: TODO: --show-fec            fec-get (fixme)
  tools/net/ynl/pyynl/ethtool.py:165:5: W0511: TODO: --dump-module-eerpom  module-eeprom-get (fixme)
  tools/net/ynl/pyynl/ethtool.py:166:5: W0511: TODO:                       pse-get (fixme)
  tools/net/ynl/pyynl/ethtool.py:167:5: W0511: TODO:                       rss-get (fixme)
  tools/net/ynl/pyynl/ethtool.py:179:9: W0511: TODO: parse the bitmask (fixme)
  tools/net/ynl/pyynl/ethtool.py:196:9: W0511: TODO: parse the bitmask (fixme)
  tools/net/ynl/pyynl/ethtool.py:321:9: W0511: TODO: pass id? (fixme)
  tools/net/ynl/pyynl/ethtool.py:330:17: W0511: TODO: support passing the bitmask (fixme)
  tools/net/ynl/pyynl/ethtool.py:459:5: W0511: TODO: wol-get (fixme)

  ------------------------------------------------------------------
  Your code has been rated at 9.97/10 (previous run: 8.59/10, +1.38)

v1 -> v2
 - Fix f-string compatibility with python 3.9, thanks Jakub
 - Fix AI review comments

https://netdev-ai.bots.linux.dev/ai-review.html?id=40420bc1-8119-4977-8062-e2047d90ae91

Donald Hunter (13):
  tools: ynl: pylint suppressions and docstrings
  tools: ynl: fix pylint redefinition, encoding errors
  tools: ynl: fix pylint exception warnings
  tools: ynl: fix pylint dict, indentation, long lines, uninitialised
  tools: ynl: fix pylint misc warnings
  tools: ynl: fix pylint global variable related warnings
  tools: ynl: fix logic errors reported by pylint
  tools: ynl: ethtool: fix pylint issues
  tools: ynl: fix pylint issues in ynl_gen_rst
  tools: ynl-gen-c: suppress unhelpful pylint messages
  tools: ynl-gen-c: fix pylint warnings for returns, unused, redefined
  tools: ynl-gen-c: fix pylint None, type, dict, generators, init
  tools: ynl-gen-c: Fix remaining pylint warnings

 tools/net/ynl/pyynl/cli.py               |  67 +++++---
 tools/net/ynl/pyynl/ethtool.py           |  47 +++--
 tools/net/ynl/pyynl/lib/__init__.py      |  10 +-
 tools/net/ynl/pyynl/lib/doc_generator.py |   3 +-
 tools/net/ynl/pyynl/lib/nlspec.py        |  77 +++++----
 tools/net/ynl/pyynl/lib/ynl.py           | 208 +++++++++++++----------
 tools/net/ynl/pyynl/ynl_gen_c.py         | 178 ++++++++++---------
 tools/net/ynl/pyynl/ynl_gen_rst.py       |   2 +
 8 files changed, 343 insertions(+), 249 deletions(-)

-- 
2.52.0

