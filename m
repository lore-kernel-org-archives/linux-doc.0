Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB7246A5FD
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 13:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392236; cv=none; b=Cwc8vd6z2O2nntGHX7VZOCuToENuEesn4o6GJcybsiQa+xl2d4wiIZn7QoQ9Tn/PiltWn0Dyhx5dAdIWal6noOpgtTobLShC7aQTLaIhXcff4C12dXFecmweK0sS9mderJN10h1f1YObb9TQm2WCnoSUg22hPJpPPHLxFCXJI7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392236; c=relaxed/simple;
	bh=OuTIZeT/AghyPafQp3fT5mJjsC+pfQMeOe4QJeL3G+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UON5LFCl/LxbeB/YxVjkEIat4sEm3fp3NmwH9YD0BebDQ91uyoki7Oh212NyVoWH8Czc+IP6Ra6nsrgFaCTohIS5Ej7nCYZGtqKnH/NuGOx4xMkQE1EIpa8dFvY9zh0PvuAj6RSMAv6X6G6ratDNkABMtHw2hAneQhk8i4nzEZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9E8vfHp; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9E8vfHp"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d6e954afbdso25107175ad.2
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 06:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789392235; x=1789997035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M7vTzUhnMyED4pEMC1tFaqZHzEKwfASC7IbldcQj558=;
        b=I9E8vfHpJzpnAqcqGDdNr8ASaWbC5FlcExp55dTp4FC5KQaGVPZmEVi4a6YDJ1yOXj
         /lKpLuY1olOxiXAGjKFmQ2mb86PRi2yNW1hQRVdk1fgOaSrmbvd/IuIkysJIxtuMSqKt
         FyhGlX0Eh53RuVyyw58eBgAXGeVq5uC+F1ACZUmcIwWUFFGN+NpAZezV4LTPNlxamyRC
         4fXjoD58OoZWc1okDcIojYJ812dAep/Ibi9t69pn4z42Jsdk4r5LmG4XMgv7b/pIONM9
         SlalsBBGD3m1qUMFlhrFyKDS32TUqBwVsqFNUbE3gFRUKgjuLu8USn1XIAMtxT2kkdCo
         j9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789392235; x=1789997035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M7vTzUhnMyED4pEMC1tFaqZHzEKwfASC7IbldcQj558=;
        b=o8lUHwXXvwkHkA/Knkf2h81T6swaBcp9YdStz1su3bEfNVyHK2z6k2lO1Ud5quAUTC
         PuMp1UJ/dHm1cdHD5NC5JLZWFEJ1H2axyTxkO4X9tGJTu1WEHJIsqeQ/3+Qoq/e9qp4k
         E7Jc9yo+EGZyM00vRw0MKsoOxcP34SHErq7dqRl5bwBQIfzO1g1A7qfMJG2gzDWt9XPi
         6oZF8S8OEN45FYgMhgXKsv6Glbs+3ewwp4qKWGM+iW7zEfVKr0mc28mElKP/DUBr8MIo
         tYnIdT2hKDdvemxnhfBm1hZ8qKoCEDpg4+YA27JKKwKnH2eNR2fnGUw59/tXWBwETjax
         OlSA==
X-Forwarded-Encrypted: i=1; AKwUvBz1/frgDa06+x+HHDRGC+baR98BpBcQnHI48BPXNRWGE/HEdR6MnP916zyqS5Rw4WjpRMP4MtD0Lug=@vger.kernel.org
X-Gm-Message-State: AFuF++kWXOqSSsR5eLH/zGveosNMmTOH+Ufngkay3ckFoOsWXEUIiZTz
	2HJmahLUw2S60AY6C6FGtIDHRy626RevAGrwWScZ2hHBfNzCFanGgX4=
X-Gm-Gg: AYBFou3FJddKO7saGCHER/REtVo1ew4xWxP9ZTYriZsrwrgRQrzQCdClXzX8VJBFXJT
	bPpSN+ynGREjAUi5rxGg0+oZlS7HgCp4uYYupix1tv2CQhe7hDvB7163aDGDM43M/oelO24aa7c
	FrHCBLZRqwfwAJaHXD+SCCOTd/sSNVpPhbLNRZ89v1sybknacatjItK7pMG48J/ZM4R5ba5dPKc
	unvnfWGITCfP2jwevv90k0uRx/oMlstJfHHnlxpseqbk+BEFH9JK5yha0DNWYS+f4TW4PNwfHqk
	GazylnnOoWM0QCGYf99EeQfoPSdsIEmCnZzIQzEpg20Q5w92Mda+XD58rwmGJusSKaVtHOfrL0b
	8W1O0rihvmfcNcEzrMvNa1MQcif9tWUoeEzzJklpukzW1CXczHB81eeuLlymIIKX+VHorOLFUq1
	OhJp5ZPfKrl0z30zoEsNXmnHzw6CTsm13Vq8cIio64vo3bcymoBmMfCTmldAGXFdYEklBC+zGPf
	fwqKcIKGrhgUfNdu31gBNvdpnY=
X-Received: by 2002:a17:902:d4cd:b0:2d8:df44:a5c2 with SMTP id d9443c01a7336-2dd6c76c7f8mr50088735ad.20.1789392234581;
        Mon, 14 Sep 2026 06:23:54 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:3b80:bc61:4619:5346])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd5650198csm26768095ad.84.2026.09.14.06.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:23:53 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	zanussi@kernel.org,
	namhyung@kernel.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH] tracing: Clamp the printed end of a histogram bucket at U64_MAX
Date: Mon, 14 Sep 2026 22:23:46 +0900
Message-ID: <20260914132346.2234731-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A key with the ".buckets=N" modifier is stored as the start of its bucket,
and hist_trigger_print_key() prints the range it covers as start to
start + N - 1. That addition overflows once the start is within N of
U64_MAX:

  # echo 'hist:keys=offset.buckets=10' >> \
      events/syscalls/sys_enter_lseek/trigger
  # ./seeker 5 -1                      # lseek(0, 5) and lseek(0, -1)
  # cat events/syscalls/sys_enter_lseek/hist
  ...
  { offset: ~ 18446744073709551610-3 } hitcount:          1
  { offset: ~ 0-9 } hitcount:          1
  ...

18446744073709551610 + 10 - 1 does not fit in 64 bits, so the range ends
below where it starts.

The bucket does end at U64_MAX: it holds every value hist_field_bucket()
maps onto its start, and there is no value above U64_MAX. Clamp the printed
end there. Printed honestly the group is shorter than the size asked for,
which histogram.rst does not mention, so say it there.

Fixes: de9a48a360b7 ("tracing: Add linear buckets to histogram logic")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Assisted-by: Claude:claude-fable-5
---
Tested under QEMU/KVM on 704340f1cd0d, x86_64, unfixed arm first.  Keys come
from lseek(2) offsets.

Nine cases over buckets=1, 10 and 16.  One printed range differs:

  buckets=10, key 18446744073709551610
    before  ~ 18446744073709551610-3
    after   ~ 18446744073709551610-18446744073709551615

The other eight are identical on both arms.

ftracetest test.d/trigger: 42 pass, 2 xfail, 1 fail, per-test verdicts
identical on both arms.  The failure is trigger-synthetic-event-dynstring.tc,
which needs a ping(8) that is not a busybox applet.  No case in the suite
uses .buckets.

 Documentation/trace/histogram.rst | 3 +++
 kernel/trace/trace_events_hist.c  | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/trace/histogram.rst b/Documentation/trace/histogram.rst
index 340bcb5099e7..97b67f05f5ea 100644
--- a/Documentation/trace/histogram.rst
+++ b/Documentation/trace/histogram.rst
@@ -1943,6 +1943,9 @@ the ".buckets" modifier and specify a size (in this case groups of 10)::
       Entries: 16
       Dropped: 0
 
+Keys are 64-bit, so the group holding the largest values is truncated where
+that range ends and can be smaller than the size asked for.
+
 To save stacktraces, create a synthetic event with a field of type "unsigned long[]"
 or even just "long[]". For example, to see how long a task is blocked in an
 uninterruptible state::
diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 8af97fd4ee2d..86df1a29d8d5 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -5560,9 +5560,14 @@ static void hist_trigger_print_key(struct seq_file *m,
 				   *(u64 *)(key + key_field->offset));
 		} else if (key_field->flags & HIST_FIELD_FL_BUCKET) {
 			unsigned long buckets = key_field->buckets;
+			u64 end;
+
 			uval = *(u64 *)(key + key_field->offset);
+			end = uval + buckets - 1;
+			if (end < uval)
+				end = U64_MAX;
 			seq_printf(m, "%s: ~ %llu-%llu", field_name,
-				   uval, uval + buckets -1);
+				   uval, end);
 		} else if (key_field->flags & HIST_FIELD_FL_STRING) {
 			seq_printf(m, "%s: %-50s", field_name,
 				   (char *)(key + key_field->offset));
-- 
2.53.0

