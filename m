Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 54659137
	for <linux-doc@vger.kernel.org>; Mon, 20 Nov 2023 02:02:29 -0800 (PST)
Received: from loongson.cn (unknown [112.20.112.120])
	by gateway (Coremail) with SMTP id _____8Bxd+izLltlIi87AA--.15208S3;
	Mon, 20 Nov 2023 18:02:27 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.120])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxP92yLltlJG5HAA--.27432S2;
	Mon, 20 Nov 2023 18:02:26 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: corbet@lwn.net,
	seakeel@gmail.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	alexs@kernel.org,
	bobwxc@email.cn,
	wu.xiangcheng@linux.dev,
	yizhou.tang@shopee.com,
	linux-doc@vger.kernel.org,
	chenhuacai@kernel.org
Subject: [PATCH v1 0/3] docs/zh_CN: Translate maintainer-pgp-guide and adjust magic-number
Date: Mon, 20 Nov 2023 18:02:22 +0800
Message-Id: <cover.1700474235.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxP92yLltlJG5HAA--.27432S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtw4Duw1ktr1xZFW7WryxCrX_yoWxtFc_ZF
	n8ZayFyr4xtF9rtay09F45ArWDAr4Iga4DJFs5trWUCw4xJrs8XFykAFnYg3y8CFnxtry5
	KrWkGw1xWF13uosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbS8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
	Jw1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j0pB-UUUUU=

My patch set translates maintainer-pgp-guide into
Chinese, adjust each line length of magic-number
and update process/index to latest.

Yanteng Si (3):
  docs/zh_CN: add process maintainer-pgp-guide tanslation
  docs/zh_CN: Adjust the number of characters per line in
    magic-number.rst to less than 40
  docs/zh_CN: Update process index to 6.7-rc2

 .../translations/zh_CN/process/index.rst      |  53 +-
 .../zh_CN/process/magic-number.rst            |  69 +-
 .../zh_CN/process/maintainer-pgp-guide.rst    | 789 ++++++++++++++++++
 3 files changed, 873 insertions(+), 38 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst

-- 
2.31.4

