Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2E84B95A6
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 10:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886950; cv=none; b=u1d0SXeOqYSYxiusT8PwOZOG7HRjNPhP8cMkbmU11bwqJUkoTxMpPHGrBhOpAIq4sS1bWVvBR66A3UlfqQAKtD4b6PpmGTbwNpLz6hhQD1QEX4teu9mC7yEJ5MFqsY7NwBu/dusoJ3A9sOwnkMx40eQs9aY+nLezYjZCS6rZDiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886950; c=relaxed/simple;
	bh=QoEj15VW5Rz/BMW3IO7hDxn+DIbOJK1iyO5Ue5ss1Cs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nA/jqvQ/mly+i7zja1GJTgjLsa4oQVNZecexHA2RBkKQRLlpuacqEKuaXxm3zUIZotWQsWqqmpkyELiWK6SlTZIR2BzpQRAVbLjwy0mQPosFOQzgGk+6yVBEjVrh2keKUpbDA9WNMyB6ZPOyrICZYPHX6O7ze0cTQ7OAK1wo+kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1gtat1U; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1gtat1U"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2e8c710847so338724066b.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 03:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791886947; x=1792491747; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Jof7IVRuzH/+jDJxaXeOI9qqOFJlE7BBc0KXq3UCoT4=;
        b=e1gtat1UroLRRcxrsVgi37cBpcWnug0mH3kSjpDho26Mfz/FaFcxYvyEOJiNdINTWq
         ZmIOzGUyDDy5ZZm8HsF5TaUSPGpCrgNkCJ+WvUvS9uaB0AGn4dLI+dvY99hBbZD2/q0b
         2zCd2hZiO8ijMbJv05Y7OoXlTY/cvJa3X+klzbVDYiumMkODxuHna5u4f21elZojmh1N
         /E7ln/HOgPmM3vsmqAhZ5eQJ4vkIr6LSPkxQizqkJJf3KAa1EDCh+q3jgeOIZHe9BY+2
         DHRQpZu2MBbsMCal1g4Hd3+vxhFtn39IbylkkJhXFdbLbVNPcrV98CaiCXbhijrfTvdw
         nO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886947; x=1792491747;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jof7IVRuzH/+jDJxaXeOI9qqOFJlE7BBc0KXq3UCoT4=;
        b=cbRLri3EdKBLUekMYxkZBh9easTVpMdPLyKYP33hgrcO52IgGHFdsWI4GTsIO6bBuo
         g7Cdt/Q/XbbTXstzh/0KPonaSq9NZKvMXO5EqoNpyuNZuxrlAksR1Y8+FoFP4wcyPsAF
         HH+99ORtVCUHw1Pvr3pw6YJUw0dME/1UEj7+7ohrMlJOj7SsBYM73iX8DrADN+/Un0lt
         mvU0FJcDXehq7q2QHlHVVoQ5kdgF+bai71QFi57M1u5tKBMZUgpcYZbSDdY4r9mCa09+
         kqFK2HH+RwqltTaFr+Cdgbj1LC7986lHab3oaZyssVPEPsLEyCYwP97BV81OXYdzgAXd
         VyYA==
X-Forwarded-Encrypted: i=1; AKwUvBynXlPMjE8lbYtMt8ERLfbhN8+xvNqAj7ldO54EXrTe4F4BdkcadwiZ5nMprGc0/fCbA89iaiQv+3E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkBb22WnRBAGubHqQeaGfrXoShzxYNFPnC+i2HK+Kuefz7VCDH
	3z7Y4OwrTqPj32oWlwQUT+LjbSrL6XBsB/OX1Y7TbggLRogQG6UMeava
X-Gm-Gg: AYBFou2pnk+x7fCEMHXya/ZywQpqKn+6InV25rhWKRst72MWXqLBJnVdV2NjILXOqhO
	HJx+iakK6HXWBAFjK6rqfF7QyXGyFhujfSBYxwr9MrQuuuwciAp2Oyo+H4Sdz49MdZi3Jcwe5xE
	9MY5HXw2X+cU9aZSkNBSe+3wT/5y9BBoN6ufvCEOiU4ypDIfIUHJ7P35FW16d96406C4aA2Uq9Y
	uY0bOCw0B/qwkps0mc7vYn2h97OXyMQlIEz8PhHJo/b3tTToDGyuoi1ypJFAzRtBvyvpCB7fITW
	4752mne5lPy3NyyBOn4fcg16AoNBSS4yHHG/Y6G7t0/N0nxB8XNwFQzb8hjImUVQAUbs2YZH0Mh
	pY7V9IU18oJUcQrNZgNEcCDD+58+yQ/TQ9dU0tfvTTjFYSMQpaZI4PD2FDZRbALTGQL3cFsnQhA
	S1RCQZ+XjNstNeaord2rkP9fzzuuWeDyTCua9PJ9FWFGLUQzi+cpMkT0Ga9rLCmdUAbd8ljggcf
	RRbABseV0fBEuE1kgqVEk4wc4j/xJoqDA==
X-Received: by 2002:a17:907:3fa9:b0:c26:1649:47af with SMTP id a640c23a62f3a-c31a9fb6451mr1167409166b.37.1791886946440;
        Tue, 13 Oct 2026 03:22:26 -0700 (PDT)
Received: from [127.0.0.2] ([2a05:f6c4:d34b:0:eb4c:5610:e9e4:9d1e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34d011dfccsm230739766b.42.2026.10.13.03.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:22:25 -0700 (PDT)
From: Malte Wechter <maltewechter@gmail.com>
Subject: [PATCH v3 0/4] kunit: add optional assertions to catch taint and
 lockdep warnings
Date: Tue, 13 Oct 2026 12:22:20 +0200
Message-Id: <20261013-lockdep-kunit-v3-0-cdb8ff720c1f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF0GzmoC/12NywqDMBQFf0Wybkq8Sqpd9T9KFzHeaOojkmhoE
 f+9iaUgXQ6cmbMSh1ajI9dkJRa9dtqMAbJTQmQrxgaprgMTYMBZkQLtjexqnGi3jHqmJYdC5ZU
 UdclIcCaLSr/23v3xZbdUT5RzjMRFq91s7Hs/9Gnc/drFX9unlFHOJVapgAtgdmsGofuzNAOJb
 Q8HG/J/G4KdccEVylIF/Whv2/YBkM+OPvoAAAA=
X-Change-ID: 20260812-lockdep-kunit-9628f4bcad90
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 Malte Wechter <maltewechter@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886944; l=4206;
 i=maltewechter@gmail.com; s=20260812; h=from:subject:message-id;
 bh=QoEj15VW5Rz/BMW3IO7hDxn+DIbOJK1iyO5Ue5ss1Cs=;
 b=5b/OOvl+ou89Y7VAUHkdAROHOd7sy7qPnBmX0MwIedktH3o0E+/260Bci5yCZKa921lNtpGTO
 lPb9LFujY44Dczuh1DGcB4tJ90xjfyYOJ9HcHVqhrBELZYJjM/uwx8n
X-Developer-Key: i=maltewechter@gmail.com; a=ed25519;
 pk=Ta/JQQMOW0Cbxp+yEwWqWFEyKFRyuQeSoYicwD7yvWI=

This series extends KUnit to use existing kernel diagnostics to catch
certain locking-related bugs. Specifically, it adds assertions for
`debug_locks` from lockdep and the `TAINT_WARN` flag from panic. This
aims to catch bugs such as circular locking dependencies and sleeping
functions called from invalid context, by highlighting them when they
are triggered by a KUnit test.

Add CONFIG_KUNIT_FAIL_TEST_ON_WARN and CONFIG_KUNIT_FAIL_TEST_ON_LOCKDEP,
which enable the `TAINT_WARN` and `debug_locks` assertions respectively.
The assertions are run in two places:

    1. Before a test case is run: this ensures that no tests are run if
       the kernel is tainted and/or `debug_locks` has been turned off.

    2. After each test case: this checks whether `debug_locks` has been
       turned off or `TAINT_WARN` has been set between the start and the
       end of the test.

It is important to note that if assertion 1 fails, something other than
the KUnit test case turned off `debug_locks` or tainted the kernel. This
is not investigated further, but the kernel is treated as 'unreliable',
and all subsequent test cases are forcefully skipped.
For assertion 2, there is no guarantee that it was the thread
executing the test case that made the kernel 'unreliable'. This is not
investigated further either, but as with assertion 1, all subsequent
test cases are forcefully skipped and the KUnit log is shown.

Tests that trigger a `WARN()` on purpose are expected to use the warning
suppression added in commit 85347718ab0d ("bug/kunit: Core support for
suppressing warning backtraces"). Suppressed warnings do not taint the
kernel, so with `CONFIG_KUNIT_FAIL_TEST_ON_WARN` only unexpected
warnings fail a test. Running all KUnit tests with
`CONFIG_KUNIT_FAIL_TEST_ON_WARN` enabled currently fails `Log base 2 of
0` in `intlog2_test`, because it deliberately triggers a `WARN()`
without suppressing it, which force-skips all subsequent tests. Running
all tests with `CONFIG_KUNIT_FAIL_TEST_ON_LOCKDEP` enabled does not
change any existing test results.

The new options depend only on `CONFIG_KUNIT` (and `CONFIG_LOCKDEP` for
CONFIG_KUNIT_FAIL_TEST_ON_LOCKDEP) and can be enabled independently.

Signed-off-by: Malte Wechter <maltewechter@gmail.com>
---
Changes in v3:
- rebase onto v7.3-rc6
- add forced_skip logic to kunit, enabling marking tests as forcefully skipped
- split CONFIG_KUNIT_EXTRA_ASSERTS into two sepperate configs.
- extend kunit_parser.py and kunit_printer.py to handle forcefully skipped test cases
- make forcefully skipped tests be marked as failed in kunit_json
- add new section to kunit documention at Documentation/dev-tools/kunit/failing_on_warnings.rst
- Link to v2: https://patch.msgid.link/20260824-lockdep-kunit-v2-0-36a6fec9f72e@gmail.com

Changes in v2:
- Implement changes directly in C KUnit instead of Rust KUnit wrapper
- Remove rust specific configs and add general CONFIG_KUNIT_EXTRA_ASSERTS config
- Link to v1: https://patch.msgid.link/20260818-lockdep-kunit-v1-0-66ceb1a272e3@gmail.com

---
Malte Wechter (4):
      kunit: add logic for tracking forcefully skipped test cases/suites
      kunit: add assertions for lockdep inside of kunit
      kunit: add assertions for TAINT_WARN inside of kunit
      Documentation: kunit: add documentation and examples to kunit documentation

 .../dev-tools/kunit/failing_on_warnings.rst        |  78 ++++++++++++
 Documentation/dev-tools/kunit/index.rst            |   1 +
 include/kunit/test.h                               |   4 +
 lib/kunit/Kconfig                                  |  23 ++++
 lib/kunit/test.c                                   | 135 ++++++++++++++++++---
 rust/kernel/kunit.rs                               |   1 +
 tools/testing/kunit/kunit_json.py                  |   2 +
 tools/testing/kunit/kunit_parser.py                |  36 +++++-
 tools/testing/kunit/kunit_printer.py               |   3 +
 9 files changed, 258 insertions(+), 25 deletions(-)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20260812-lockdep-kunit-9628f4bcad90

Best regards,
--  
Malte Wechter <maltewechter@gmail.com>

