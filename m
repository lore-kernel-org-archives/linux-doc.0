Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48EB61A587;
	Tue, 19 Dec 2023 12:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxueiOkYFl8JwCAA--.13121S3;
	Tue, 19 Dec 2023 20:50:22 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxIL+BkYFl+1YAAA--.2309S7;
	Tue, 19 Dec 2023 20:50:21 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/5] docs: submit-checklist: Remove all of "make namespacecheck"
Date: Tue, 19 Dec 2023 20:50:01 +0800
Message-ID: <20231219125008.23007-6-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231219125008.23007-1-yangtiezhu@loongson.cn>
References: <20231219125008.23007-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxIL+BkYFl+1YAAA--.2309S7
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZw4DAFyfKF1fJFWrAFyUXFc_yoW5Zr1fpF
	nF9w1Sg3Z7GryrAryxKr18JryrZFWxCFZ2vF4jq34SqF4DWrW8Ka9IyF90kFW7GryFyay7
	XFWFyryUGry29FbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOdb8UUUUU=

After commit 7dfbea4c468c ("scripts: remove namespace.pl"),
scripts/namespace.pl has been removed from the kernel, and
"make namespacecheck" has been removed from the English
version of submit-checklist.rst, so also remove it in the
related translations.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 Documentation/translations/ja_JP/SubmitChecklist              | 4 ++--
 Documentation/translations/zh_CN/process/submit-checklist.rst | 3 +--
 Documentation/translations/zh_TW/process/submit-checklist.rst | 3 +--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/Documentation/translations/ja_JP/SubmitChecklist b/Documentation/translations/ja_JP/SubmitChecklist
index 4429447b0965..1759c6b452d6 100644
--- a/Documentation/translations/ja_JP/SubmitChecklist
+++ b/Documentation/translations/ja_JP/SubmitChecklist
@@ -56,8 +56,8 @@ Linux カーネルパッチ投稿者向けチェックリスト
 
  9: sparseを利用してちゃんとしたコードチェックをしてください。
 
-10: 'make checkstack' と 'make namespacecheck' を利用し、問題が発見されたら
-    修正してください。'make checkstack' は明示的に問題を示しませんが、どれか
+10: 'make checkstack' を利用し、問題が発見されたら修正してください。
+    'make checkstack' は明示的に問題を示しませんが、どれか
     １つの関数が512バイトより大きいスタックを使っていれば、修正すべき候補と
     なります。
 
diff --git a/Documentation/translations/zh_CN/process/submit-checklist.rst b/Documentation/translations/zh_CN/process/submit-checklist.rst
index 3d6ee21c74ae..10536b74aeec 100644
--- a/Documentation/translations/zh_CN/process/submit-checklist.rst
+++ b/Documentation/translations/zh_CN/process/submit-checklist.rst
@@ -53,8 +53,7 @@ Linux内核补丁提交检查单
 9) 通过 sparse 清查。
    （参见 Documentation/translations/zh_CN/dev-tools/sparse.rst ）
 
-10) 使用 ``make checkstack`` 和 ``make namespacecheck`` 并修复他们发现的任何
-    问题。
+10) 使用 ``make checkstack`` 并修复他们发现的任何问题。
 
     .. note::
 
diff --git a/Documentation/translations/zh_TW/process/submit-checklist.rst b/Documentation/translations/zh_TW/process/submit-checklist.rst
index 942962d1e2f4..dda456a73147 100644
--- a/Documentation/translations/zh_TW/process/submit-checklist.rst
+++ b/Documentation/translations/zh_TW/process/submit-checklist.rst
@@ -56,8 +56,7 @@ Linux內核補丁提交檢查單
 9) 通過 sparse 清查。
    （參見 Documentation/translations/zh_CN/dev-tools/sparse.rst ）
 
-10) 使用 ``make checkstack`` 和 ``make namespacecheck`` 並修復他們發現的任何
-    問題。
+10) 使用 ``make checkstack`` 並修復他們發現的任何問題。
 
     .. note::
 
-- 
2.42.0

