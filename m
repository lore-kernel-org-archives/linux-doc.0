Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675694;
	b=vXHpWLJN8otDSQ0FijVBgwMW4xrNiwr+oxPW4FeqviSLWhCjVmhnZaAEQiRln964fSlJ
	 YMCayCNGebvZx+x7uEXoiVy19OkKEoBzo6ixV4B+UcaB95XgmrkbeOrCynuAWZjak5U1c
	 IZB20JfJscIPe/6xn2OET0v6D/DiN9gfY61MjgeUOCDjY3Ugmg1dXnKQuWrCKLbnjL/Ro
	 Zo2b9vEB2b0P18DAT2VmpgSCdI0yXMPIDOodEhoP2FwLbGkuoZlf9MLP4nIyTyAzkoYaK
	 oocwPbRXWPNQ6Mhpd/gN2KqGWQi2kkmZgsuQB/sKPc4rLc/ryhlkiFZZXtV6Sejm1ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ep+n5rIbIBkWijYN/P8smm9x/IxlgV6O3xbPYJDU0As=;
	b=CEpHhl8H0x3jRKxHa0TPyiPZlDanwFAZ+Fw2e6TyZODHT12hvCBWCngyBfn4vCk0eYLk
	 k0B/4XKw2+hwyGh6/Ef6Si064XGuFDemAdZ03jKS+xnJ14Ns0iFbMvfPVZIsRpifslh2s
	 c9d5wQELQbpFXmusaNZppWWPVLLZcD1CGb7pP29SUYMVlIn7tnNCeVZTvtIZTuDvabIey
	 XOMLoXJ8pBjkVAu3d3dl6ZkP5rXwez8MMXmnLSBA5DHKX+3j7lnuoaPT9To8Wh4t29rhI
	 CAQUKTj5T3S1CFms86AgdsByVAtH+muATNKXpyJYyODrR+dJNPIU9blJXTdmhU3TTRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CpNp+i54;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858F6606A329
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 17:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 858F6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CpNp+i54
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so2679239eec.0
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 09:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675694; x=1795280494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ep+n5rIbIBkWijYN/P8smm9x/IxlgV6O3xbPYJDU0As=;
        b=CpNp+i54/v6tOHdyDxVQNdYBsB9xSD8IrZMj5lzcvealEleNlvsVZpKDskPYge19oz
         wyW5fMmtJj4tccpwzgdZjRZJ4rcvlMvb+4XVXNE5hzFxijuoLQwPhKSmq1z1IZsVUajg
         TmdXLTER3QqDCHqjr947KNxpwILpkOtzaWuCpCb6LDB//A6gNtNIDW495JeEibg+xlLp
         Cl9Aij89Py2OCKzmRAmKLyPr+rPwYT6XCsrTbene1IBVP4SrVt4Z3FxHxkdyq6vnuEot
         0uIohD1XJynwnL2Fm6M0jdakxFLhGmL+uhfYGG5RRISmiDXphXHz1JL5PTtUSD46sPex
         WupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675694; x=1795280494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ep+n5rIbIBkWijYN/P8smm9x/IxlgV6O3xbPYJDU0As=;
        b=1hwg9vcHtlvPz/4KGE8oJ6WVUxMt+4cWAyw5d7lEfdL9bWCCKSYWSIEXrGb41ewZAJ
         vyLa5BiCWfvctb7oNZlZDuRBCd/p3ZN+f4TXCuQ/fwrRMruCKhigMwrHa2nypYt/VFeH
         n6a/5vYW4ayew+DANg1ifQcWw/z454CYn9L9qN4816z5F0vmHWEASDyhwQo36F2yjEXj
         mke9ibFsDfUaP4D9x3mNKnT0JM6vkGwgyIEdFv6iBk5Hpf/dJxAwDRNgm6Er6TChCEVy
         InIpFYGCZlg80N6jV1AuCS7YP+mtksKKUZ7E6zfMsjTVbuieVZTUCb0LRn1tGZkdcj/c
         Jjvg==
X-Forwarded-Encrypted: i=1; AL+hErGdWXdoQQ1yRWJN9paZKgEjAkgEVo3xCTPgU0qyo622jBMUNNjoLD1RVlpKsK8p38NQ9H5rbtVa58U=@vger.kernel.org
X-Gm-Message-State: APuU4Z89A1ymuGaUEAlwZdx0CTDENZDSnfBdIgXMgF9mEKY5WuOAkWWG
	DwXqxCZUr5S83NMstwFYxtTKk1C+qW0SsiEXHYw7fkcI0AtCVAstVATR
X-Gm-Gg: AYBFou3iWpdVav4I958B+acWVBZDKZZpBxjsHmJ1DJ7yPkKQFz+qQ3GRdT068wl8BZv
	WgEA5aibbmcQQDiKzjtumXG9dMO1UO5ybK9gx/OYhSA/eZ6jsl4tw+jCLCCbecXcnjeCMhaUPIz
	PeOM+hItBtNIvkm9f4vC7los77btVErNLFmaOZLrF46ZjTFOR7Hv3mA0/gaANehIYB8EE/ealAM
	BLEWDr4Ta630g+oSePyr3xatvAsR0TSxktQcaWoAe5BTR09rSOydf/K2iq/FT3w2cZgUWKKJuH+
	xBjW0bIxdGa0/ydmXtKjn6xmRbhx93xw250womZO6Zo060N/T2Qyhun3q3f4a6YjXT+zpm9Vmb8
	oQPhhAS03YmxHv11PhdFXjX6YmFdCdRjl3o3KVqDewyWfClCMqoPLeawWeJ5Q25FXxNzxOysgQI
	DhYUc9MIbdgczM+Mpn0mm5yNDKmRT/bEkis4qjca6i1f13+FL/If7SwU4HYd0pvMNyTl3SqVHkL
	T59as4diioOa9lW5AElT19f2kXkhA8EBCCt96o8va0/JPc5qfoFG3i59hhpKRH+TaddKqh+e2Bw
	IwG07CesTmDej8rQNpCPh/oRpJhYU1xW6bpemjXNhs4=
X-Received: by 2002:a05:693c:808f:b0:351:29c8:643 with SMTP id 5a478bee46e88-379675fc97fmr5683571eec.18.1794675693304;
        Sat, 14 Nov 2026 09:01:33 -0800 (PST)
Received: from LAPTOP-G6J9COQB.lan ([182.253.124.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm31586761eec.21.2026.11.14.09.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:01:32 -0800 (PST)
From: Ahmad Wicaksono <supersonix03@gmail.com>
To: bpf@vger.kernel.org
Cc: rhkrqnwk98@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	john.fastabend@gmail.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	Ahmad Wicaksono <supersonix03@gmail.com>
Subject: [PATCH bpf-next 0/2] Documentation/bpf: Fix stale references in map docs
Date: Sun, 15 Nov 2026 00:01:15 +0700
Message-ID: <20261114170117.196552-1-supersonix03@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Two documentation fixes for the BPF map pages.

Patch 1 records that since commit be39165224d0 ("bpf, sockmap: Disallow
update and delete from tc, xdp, socket_filter and flow_dissector"), only
BPF_TRACE_ITER tracing, sock_ops (delete only), sk_reuseport and
sk_lookup programs may mutate a sockmap or sockhash; anything else is
rejected with "cannot update sockmap in this context". The kernel-side
sections of map_sockmap.rst did not mention this. It also drops the
reference to progs/test_sockmap_update.c, removed by
commit 5de7a6eaed89 ("selftests/bpf: Drop
tc/xdp/flow_dissector/socket_filter sockmap mutation tests").

Patch 2 fixes two moved selftests paths: test_lpm_map.c, now
map_tests/lpm_trie_map_basic_ops.c, and test_xdp_noinline.c, now under
progs/.

Documentation only; no functional change.

Ahmad Wicaksono (2):
  Documentation/bpf: Update sockmap docs for mutation restrictions
  Documentation/bpf: Fix stale selftests file references

 Documentation/bpf/btf.rst          |  2 +-
 Documentation/bpf/map_lpm_trie.rst |  6 +++---
 Documentation/bpf/map_sockmap.rst  | 18 ++++++++++++++++--
 3 files changed, 20 insertions(+), 6 deletions(-)

checkpatch.pl --strict is clean. make SPHINXDIRS=bpf htmldocs gives
identical warnings before and after. Documentation only, so nothing to
run-test.

base-commit: ca4181cacb0c6a5632018f1c94f29d9dbc0e9270
-- 
2.43.0

