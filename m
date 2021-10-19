Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2048DC433EF
	for <linux-doc@archiver.kernel.org>; Tue, 19 Oct 2021 15:08:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F34E6613B3
	for <linux-doc@archiver.kernel.org>; Tue, 19 Oct 2021 15:08:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233545AbhJSPKP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Oct 2021 11:10:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:57996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233527AbhJSPKN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 19 Oct 2021 11:10:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4BF061074;
        Tue, 19 Oct 2021 15:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634656080;
        bh=WjEPB0Xf1aXQX6GI9buYFpVKc/LElMg4zZDLF5DMy4w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HPx54krvbO2AzZmu+cRDeV2wJb8/kpKLXEo9NfXk+ThD0v1fAliY4ymLowSLdcjTR
         EnI7UClzHmE+gHaGBOsyqVtXtIMHqX3gP6ixV+i0B/s0dPVwdRpwvNtTk1PludMG3h
         MCOPJKaYrFtoxu+nO/2PbK7Y1Sj1+Oj4q8Fmw8Fa9FYjcrXP4WuurDoBiZPQ29s5kD
         RdVNNIlOWOxJqMuIoBaRY1XJadft7r9JMhoRh4djZ458hN+Q1ZK2sEVkITZL3H7/do
         sGZZ4tm0+q0UB1FlUojboeSU4l6hLnhFjIc2uafyQ5N0c2BWyU7xwv3TZgBpPblF2J
         DqtQBmWjOJfDw==
From:   SeongJae Park <sj@kernel.org>
To:     akpm@linux-foundation.org
Cc:     SeongJae Park <sj@kernel.org>, Jonathan.Cameron@Huawei.com,
        amit@kernel.org, benh@kernel.crashing.org, corbet@lwn.net,
        david@redhat.com, dwmw@amazon.com, elver@google.com,
        foersleo@amazon.de, gthelen@google.com, markubo@amazon.de,
        rientjes@google.com, shakeelb@google.com, shuah@kernel.org,
        linux-damon@amazon.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 06/15] mm/damon/selftests: Support schemes quotas
Date:   Tue, 19 Oct 2021 15:07:22 +0000
Message-Id: <20211019150731.16699-7-sj@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211019150731.16699-1-sj@kernel.org>
References: <20211019150731.16699-1-sj@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This commit updates DAMON selftests to support updated schemes debugfs
file format for the quotas.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 tools/testing/selftests/damon/debugfs_attrs.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/damon/debugfs_attrs.sh b/tools/testing/selftests/damon/debugfs_attrs.sh
index 639cfb6a1f65..8e33a7b584e7 100755
--- a/tools/testing/selftests/damon/debugfs_attrs.sh
+++ b/tools/testing/selftests/damon/debugfs_attrs.sh
@@ -63,10 +63,10 @@ echo "$orig_content" > "$file"
 file="$DBGFS/schemes"
 orig_content=$(cat "$file")
 
-test_write_succ "$file" "1 2 3 4 5 6 4" \
+test_write_succ "$file" "1 2 3 4 5 6 4 0 0 0" \
 	"$orig_content" "valid input"
 test_write_fail "$file" "1 2
-3 4 5 6 3" "$orig_content" "multi lines"
+3 4 5 6 3 0 0 0" "$orig_content" "multi lines"
 test_write_succ "$file" "" "$orig_content" "disabling"
 echo "$orig_content" > "$file"
 
-- 
2.17.1

