Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473AE3AB496
	for <linux-doc@vger.kernel.org>; Sat, 29 Aug 2026 16:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788020690; cv=none; b=P6nDARKdL1Ryz7A8a/IPKzcaZvPb1QqRdgMruL2NYDukAH9aPZifu7gRk8uCgRDivBn2J1A9KpmMglzwZn1JW55t0qCVv0NKcXflG5/YLRCe/xj1W4i9M8Nhf+Y4uJ64wg9u3Oo1Kq62+Iqi/KwieZVMIfbie27xhqx6TOPGlm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788020690; c=relaxed/simple;
	bh=pfwNVxK9yoYyYkTOxBA8b4cXvFmJefmUVmRsLDxWhXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GyM8ulCA4CMrxFCOnX1GBzzwBMf9YZGl4Kyxrj2urJATT2S3N0fXsZK3OV3OKd4VB/ns36IlrSoXIiMYLnQ6sBvSsY/93AaeshjJasUav5Qy5TM3aYQpb1W1gJ0kvYmFFElh3EGfH/OHozFE3OB77e1wzFVdwIw13pQnJKIi674=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rgeb78NO; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rgeb78NO"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so1746674a91.0
        for <linux-doc@vger.kernel.org>; Sat, 29 Aug 2026 09:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788020687; x=1788625487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/FbrhZo0REKGzZ8i7ULngLJgxBkmYMYSPhdeEKVNH8o=;
        b=Rgeb78NOJmqK6mDfO6cv7Neh8RV5pi8JprHBoGfEUFIyjNgtPAnIcXn+TLU/VFVJrN
         smFdQ5C5BQUoswS2TUmp2lP6cnMo0Hk4StBwnPBfJmZHXoIa5lVlnMImBcSIqrR94RjU
         /rzCa9lnAtVezx8QIZaHoQVoAOpEFdA4P19BmDKqh3rDHtINY3G8rhquGo+hq+8yPCO1
         QWJuD23/Z/hI9ZPF+ElQFjxEBrSBtzuHfmBS09/77Q8dRCaZlInynpl5nYFMUsgI37XF
         7LErnCevAdpGBlLriXb03h0woTA8Yp7T8ERCCgXdW3YHEZr598UowhiggUxh92FPVktQ
         RtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788020687; x=1788625487;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/FbrhZo0REKGzZ8i7ULngLJgxBkmYMYSPhdeEKVNH8o=;
        b=f9ZxJWT98wGtoVG3GJphvOPCphgLU+dHERUWOyfoYELnHivGI5QSwgT8oRtY29L7N4
         1/D7Zgh6ZXS7OyIsZfP9Qzsqxjo3wawUIxNQJINt4CXFAeHuxBR9HQeKFaB/g57cwrel
         4Z+iyTsDSqP0cMfo/+Oc6gaFNY6IQwpjhLCKbjuT67BNh8WSW4+nmsDt3iarCN4oTd8r
         5hcqKLoHEHbDxWAD14NG5GqUzdtca6OJGW7rN0pVGLme5c+AfzQFy+PipNB7JJ8s/P5u
         /GobXTqGqDEahbzTI8i6Zoqd2BRt4lXwdkgwODRhkT4/9ZCwBdM1dAth2ynKoNtTbs8G
         8QOA==
X-Gm-Message-State: AFuF++kttKOS6Y6nBX3ahhuBSYS0ABLD7Axjt7MxvlFEs+bx0kVdG0gJ
	zXZXZMIl/UJLx0x5NKst7ptZeAV4eWpf54zdhh1Is+IIwn3owsED58glq8940+LD
X-Gm-Gg: AYBFou2vnT34ipElCOH/GWX+xpXog14NtpRE+2gNzh7zFoCKU9LpL37mGke7YtFzypR
	4t0OTXjFYjrflnAzTDavllSudUDsQv/Ifpr9xMtrVK70jwVEo05a0zuBQGcs0Yo05eLMhzdEN6x
	QxQXl2jYYl2HYatQ0yRypxCQHsIkHj/j2ssP66364xjY+PQ2/DHAsJ9ymDH3J1D/xRT9a2MUevf
	Q7j3gtqJDN9hmrVU+iypIw/WhBOf17XnLXx4n1Ve8wQ9mNgVjuaBkOkM0E7UuupGDx4Xg71E1r/
	FqbEj/G7PgyW1Lx0NFbf41DklzSe9iZjwyPmSbdTGtj+eK0B2yg7E9Z8hjlHDnmV4ZkmBi6dx+V
	WsYtyLNQsD3m/B5VT5QPiU+2Kj23Qyc+iETEs42u49klB0RYVexBAV1H+1+iHCMgVQjqSGL3Eyk
	0oH3us/1L0J+UVyXxhF+Pu/NcAjU1kTaoxRJu/YZ4hxBM+4N+Ra6IHV3/ZO+4KePXrNTCVAemW9
	Ln+VMe15M8VfN5K4VsfZ43aqrsm89cJRk1BRy7rV5H6wcSMii19v5SHeY8p0J0ELkqLcU/GiAx/
	hW1DcDW9+ZK1LQ==
X-Received: by 2002:a17:90b:564e:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-396d0ee7010mr24258725a91.6.1788020687292;
        Sat, 29 Aug 2026 09:24:47 -0700 (PDT)
Received: from penguin.bbrouter. ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm25183814c88.0.2026.08.29.09.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 09:24:46 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH 1/3] docs: translations: pt_BR: translate embargoed-hardware-issues.rst
Date: Sat, 29 Aug 2026 13:24:33 -0300
Message-ID: <20260829162438.13039-2-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260829162438.13039-1-danielmaraboo@gmail.com>
References: <20260829162438.13039-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Translate Documentation/process/embargoed-hardware-issues.rst into
Brazilian Portuguese and add it to the pt_BR process index.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../process/embargoed-hardware-issues.rst     | 362 ++++++++++++++++++
 .../translations/pt_BR/process/index.rst      |   1 +
 2 files changed, 363 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/embargoed-hardware-issues.rst

diff --git a/Documentation/translations/pt_BR/process/embargoed-hardware-issues.rst b/Documentation/translations/pt_BR/process/embargoed-hardware-issues.rst
new file mode 100644
index 000000000..ae1fda088
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/embargoed-hardware-issues.rst
@@ -0,0 +1,362 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Problemas de hardware sob embargo
+=================================
+
+Escopo
+------
+
+Problemas de hardware que resultam em problemas de segurança formam uma categoria
+de bugs de segurança diferente dos bugs de software puros que afetam apenas o
+kernel do Linux.
+
+Problemas de hardware como Meltdown, Spectre, L1TF, etc., devem ser tratados
+de maneira diferente porque geralmente afetam todos os Sistemas Operacionais ("OS")
+e, portanto, exigem coordenação entre diferentes fornecedores de SO, distribuições,
+fabricantes de silício, integradores de hardware e outras partes. Para alguns
+dos problemas, as mitigações de software podem depender de atualizações de
+microcódigo ou firmware, o que requer ainda mais coordenação.
+
+.. _pt_BR_Contact:
+
+Contato
+-------
+
+A equipe de segurança de hardware do kernel Linux é separada da equipe regular
+de segurança do kernel Linux.
+
+A equipe lida apenas com o desenvolvimento de correções para problemas de
+segurança de hardware sob embargo. Relatos de bugs de segurança de software puro
+no kernel Linux não são tratados por esta equipe, e o autor do relato será
+orientado a contatar a equipe regular de segurança do kernel Linux
+(:ref:`Documentation/admin-guide/ <securitybugs>`) em vez disso.
+
+A equipe pode ser contatada por e-mail em <hardware-security@kernel.org>. Esta
+é uma lista privada de oficiais de segurança que ajudarão você a coordenar uma
+correção de acordo com o nosso processo documentado.
+
+A lista é criptografada e o e-mail para a lista pode ser enviado criptografado
+por PGP ou S/MIME, e deve ser assinado com a chave PGP ou certificado S/MIME do
+autor do relato. A chave PGP e o certificado S/MIME da equipe estão disponíveis
+nas seguintes URLs:
+
+  - PGP: https://www.kernel.org/static/files/hardware-security.asc
+  - S/MIME: https://www.kernel.org/static/files/hardware-security.crt
+
+Embora os problemas de segurança de hardware sejam frequentemente tratados pelo
+fabricante de silício afetado, nós acolhemos o contato de pesquisadores ou
+indivíduos que tenham identificado uma falha potencial de hardware.
+
+Oficiais de segurança de hardware
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+A equipe atual de oficiais de segurança de hardware:
+
+  - Linus Torvalds (Fellow da Linux Foundation)
+  - Greg Kroah-Hartman (Fellow da Linux Foundation)
+  - Thomas Gleixner (Fellow da Linux Foundation)
+
+Operação das listas de e-mail
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+As listas de e-mail criptografadas que são usadas em nosso processo são
+hospedadas na infraestrutura de TI da Linux Foundation. Ao fornecer este
+serviço, os membros da equipe de operações de TI da Linux Foundation têm,
+tecnicamente, a capacidade de acessar as informações sob embargo, mas são
+obrigados à confidencialidade por seu contrato de trabalho. O pessoal de TI
+da Linux Foundation também é responsável por operar e gerenciar o restante da
+infraestrutura do kernel.org.
+
+O atual diretor de infraestrutura de projetos de TI da Linux Foundation é
+Konstantin Ryabitsev.
+
+
+Acordos de não divulgação
+-------------------------
+
+A equipe de segurança de hardware do kernel Linux não é um órgão formal e,
+portanto, é incapaz de celebrar quaisquer acordos de não divulgação. A
+comunidade do kernel está ciente da natureza sensível de tais problemas e
+oferece um Memorando de Entendimento em vez disso.
+
+
+Memorando de Entendimento
+-------------------------
+
+A comunidade do kernel Linux compreende profundamente a necessidade de manter
+os problemas de segurança de hardware sob embargo para a coordenação entre
+diferentes fornecedores de SO, distribuidores, fabricantes de silício e outras
+partes.
+
+A comunidade do kernel Linux lidou com sucesso com problemas de segurança de
+hardware no passado e possui os mecanismos necessários para permitir o
+desenvolvimento compatível com a comunidade sob restrições de embargo.
+
+A comunidade do kernel Linux possui uma equipe dedicada de segurança de hardware
+para o contato inicial, que supervisiona o processo de tratamento de tais
+problemas sob as regras de embargo.
+
+A equipe de segurança de hardware identifica os desenvolvedores (especialistas no
+domínio) que formarão a equipe de resposta inicial para um problema específico.
+A equipe de resposta inicial pode trazer outros desenvolvedores (especialistas no
+domínio) para resolver o problema da melhor maneira técnica.
+
+Todos os desenvolvedores envolvidos comprometem-se a aderir às regras de embargo
+e a manter as informações recebidas em sigilo. A violação do compromisso levará à
+exclusão imediata do problema atual e à remoção de todas as listas de e-mail
+relacionadas. Além disso, a equipe de segurança de hardware também excluirá o
+infrator de futuros problemas. O impacto dessa consequência é um impedimento
+altamente eficaz em nossa comunidade. Caso ocorra uma violação, a equipe de
+segurança de hardware informará as partes envolvidas imediatamente. Se você ou
+qualquer outra pessoa tomar conhecimento de uma potencial violação, por favor,
+relate-a imediatamente aos oficiais de segurança de hardware.
+
+
+Processo
+^^^^^^^^
+
+Devido à natureza globalmente distribuída do desenvolvimento do kernel Linux,
+reuniões presenciais são quase impossíveis para lidar com problemas de
+segurança de hardware. Conferências telefônicas são difíceis de coordenar devido
+a fusos horários e outros fatores, devendo ser usadas apenas quando estritamente
+necessário. O e-mail criptografado tem se mostrado o método de comunicação mais
+eficiente e seguro para esses tipos de problema.
+
+Início da divulgação
+"""""""""""""""""""""
+
+A divulgação começa enviando um e-mail para a equipe de segurança de hardware
+do kernel Linux, conforme a seção Contato acima. Este contato inicial deve
+conter uma descrição do problema e uma lista de qualquer silício afetado
+conhecido. Se a sua organização constrói ou distribui o hardware afetado,
+incentivamos você a considerar também quais outros hardwares podem ser
+afetados. A parte que faz a divulgação é responsável por contatar os
+fabricantes de silício afetados em tempo hábil.
+
+A equipe de segurança de hardware fornecerá uma lista de e-mail criptografada
+específica para o incidente, que será usada para a discussão inicial com o
+relator, divulgação posterior e coordenação de correções.
+
+A equipe de segurança de hardware fornecerá à parte divulgadora uma lista de
+desenvolvedores (especialistas no domínio) que devem ser informados inicialmente
+sobre o problema após confirmar com os desenvolvedores que eles aderirão a
+este Memorando de Entendimento e ao processo documentado. Esses desenvolvedores
+formam a equipe de resposta inicial e serão responsáveis por lidar com o
+problema após o contato inicial. A equipe de segurança de hardware apoia a
+equipe de resposta, mas não está necessariamente envolvida no processo de
+desenvolvimento de mitigações.
+
+Embora desenvolvedores individuais possam estar cobertos por um acordo de não
+divulgação por meio de seu empregador, eles não podem celebrar acordos
+individuais de não divulgação em seu papel como desenvolvedores do kernel
+Linux. No entanto, eles concordarão em aderir a este processo documentado e ao
+Memorando de Entendimento.
+
+A parte divulgadora deve fornecer uma lista de contatos para todas as outras
+entidades que já foram, ou devem ser, informadas sobre o problema. Isso serve
+a vários propósitos:
+
+ - A lista de entidades informadas permite a comunicação em toda a
+   indústria, por exemplo, outros fornecedores de SO, fornecedores de HW, etc.
+
+ - As entidades informadas podem ser contatadas para indicar especialistas
+   que devem participar do desenvolvimento da mitigação.
+
+ - Se um especialista necessário para lidar com um problema for funcionário
+   de uma entidade listada ou membro de uma entidade listada, as equipes de
+   resposta podem solicitar a inclusão desse especialista por parte daquela
+   entidade. Isso garante que o especialista também faça parte da equipe de
+   resposta da entidade.
+
+Divulgação
+""""""""""
+
+A parte divulgadora fornece informações detalhadas à equipe de resposta inicial
+por meio da lista de e-mail criptografada específica.
+
+A partir de nossa experiência, a documentação técnica desses problemas costuma
+ser um ponto de partida suficiente, e esclarecimentos técnicos adicionais são
+melhor feitos por e-mail.
+
+Desenvolvimento de mitigações
+""""""""""""""""""""""""""""""
+
+A equipe de resposta inicial configura uma lista de e-mail criptografada ou
+reaproveita uma já existente, se apropriado.
+
+O uso de uma lista de e-mail é próximo ao processo normal de desenvolvimento
+do Linux e tem sido usado com sucesso para desenvolver mitigações para vários
+problemas de segurança de hardware no passado.
+
+A lista de e-mail opera da mesma forma que o desenvolvimento normal do Linux.
+Os patches são publicados, discutidos, revisados e, se aprovados, aplicados a
+um repositório git não público que é acessível apenas aos desenvolvedores
+participantes por meio de uma conexão segura. O repositório contém o ramo
+(branch) principal de desenvolvimento contra o kernel mainline e ramos de
+retroporte (backport) para versões estáveis do kernel conforme necessário.
+
+A equipe de resposta inicial identificará outros especialistas da comunidade
+de desenvolvedores do kernel Linux conforme necessário. Qualquer parte
+envolvida pode sugerir a inclusão de outros especialistas, cada um dos quais
+estará sujeito aos mesmos requisitos descritos acima.
+
+A inclusão de especialistas pode ocorrer a qualquer momento no processo de
+desenvolvimento e precisa ser tratada em tempo hábil.
+
+Se um especialista for funcionário ou membro de uma entidade na lista de
+divulgação fornecida pela parte divulgadora, a participação será solicitada
+à entidade relevante.
+
+Caso contrário, a parte divulgadora será informada sobre a participação
+dos especialistas. Os especialistas são cobertos pelo Memorando de Entendimento
+e a parte divulgadora é solicitada a reconhecer a participação deles. No caso
+de a parte divulgadora ter um motivo convincente para se opor, qualquer
+objeção deve ser levantada no prazo de cinco dias úteis e resolvida com a
+equipe do incidente imediatamente. Se a parte divulgadora não reagir dentro
+de cinco dias úteis, isso é considerado como reconhecimento tácito.
+
+Após a equipe do incidente reconhecer ou resolver uma objeção, o especialista
+é informado e integrado ao processo de desenvolvimento.
+
+Os participantes da lista não podem se comunicar sobre o problema fora da
+lista de e-mail privada. Os participantes da lista não podem usar nenhum
+recurso compartilhado (por exemplo, fazendas de compilação do empregador,
+sistemas de IC, etc.) ao trabalhar em patches.
+
+Acesso antecipado
+"""""""""""""""""
+
+Os patches discutidos e desenvolvidos na lista não podem ser distribuídos a
+nenhum indivíduo que não seja membro da equipe de resposta, nem a nenhuma outra
+organização.
+
+Para permitir que os fornecedores de silício afetados trabalhem com suas equipes
+internas e parceiros da indústria em testes, validação e logística, a seguinte
+exceção é fornecida:
+
+    Representantes designados dos fornecedores de silício afetados têm permissão
+    para repassar os patches a qualquer momento para a equipe de resposta do
+    fornecedor de silício. O representante deve notificar a equipe de resposta
+    do kernel sobre o repasse. O fornecedor de silício afetado deve possuir e
+    manter seu próprio processo de segurança documentado para quaisquer patches
+    compartilhados com sua equipe de resposta que seja consistente com esta
+    política.
+
+    A equipe de resposta do fornecedor de silício pode distribuir esses patches
+    aos seus parceiros da indústria e às suas equipes internas sob o processo
+    de segurança documentado do fornecedor de silício. O feedback dos parceiros
+    da indústria retorna ao fornecedor de silício e é comunicado por ele à
+    equipe de resposta do kernel.
+
+    O repasse para a equipe de resposta do fornecedor de silício remove
+    qualquer responsabilidade civil ou legal da equipe de resposta do kernel
+    em relação à divulgação prematura que ocorra devido ao envolvimento das
+    equipes internas ou parceiros da indústria do fornecedor de silício. O
+    fornecedor de silício garante esta liberação de responsabilidade ao
+    concordar com este processo.
+
+Lançamento coordenado
+"""""""""""""""""""""
+
+As partes envolvidas negociarão a data e a hora em que o embargo termina. Nesse
+ponto, as mitigações preparadas são publicadas nas árvores de kernel relevantes.
+Não há processo de pré-notificação: as mitigações são publicadas publicamente e
+disponibilizadas para todos ao mesmo tempo.
+
+Embora entendamos que problemas de segurança de hardware exijam tempo de embargo
+coordenado, o tempo de embargo deve ser restrito ao mínimo necessário para que
+todas as partes envolvidas desenvolvam, testem e preparem suas mitigações.
+Estender o tempo de embargo artificialmente para cumprir datas de palestras em
+conferências ou outros motivos não técnicos cria mais trabalho e ônus para os
+desenvolvedores e equipes de resposta envolvidos, pois os patches precisam ser
+mantidos atualizados para acompanhar o desenvolvimento contínuo do kernel
+upstream, o que pode criar alterações conflitantes.
+
+Atribuição de CVE
+""""""""""""""""""
+
+Nem a equipe de segurança de hardware nem a equipe de resposta inicial atribuem
+CVEs, nem os CVEs são necessários para o processo de desenvolvimento. Se os CVEs
+forem fornecidos pela parte divulgadora, eles poderão ser usados para fins de
+documentação.
+
+Embaixadores do processo
+------------------------
+
+Para obter assistência com este processo, estabelecemos embaixadores em várias
+organizações, que podem responder a perguntas sobre ou fornecer orientações
+acerca do processo de relatórios e tratamento posterior. Os embaixadores não
+estão envolvidos na divulgação de um problema específico, a menos que seja
+solicitado por uma equipe de resposta ou por uma parte divulgada envolvida.
+A lista atual de embaixadores:
+
+  ============= ========================================================
+  AMD           Tom Lendacky <thomas.lendacky@amd.com>
+  Ampere        Darren Hart <darren@os.amperecomputing.com>
+  ARM           Catalin Marinas <catalin.marinas@arm.com>
+  IBM Power     Madhavan Srinivasan <maddy@linux.ibm.com>
+  IBM Z         Christian Borntraeger <borntraeger@de.ibm.com>
+  Intel         Tony Luck <tony.luck@intel.com>
+  Qualcomm      Trilok Soni <quic_tsoni@quicinc.com>
+  RISC-V        Palmer Dabbelt <palmer@dabbelt.com>
+  Samsung       Javier González <javier.gonz@samsung.com>
+
+  Microsoft     James Morris <jamorris@linux.microsoft.com>
+  Xen           Andrew Cooper <andrew.cooper3@citrix.com>
+
+  Canonical     John Johansen <john.johansen@canonical.com>
+  Debian        Ben Hutchings <ben@decadent.org.uk>
+  Oracle        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
+  Red Hat       Josh Poimboeuf <jpoimboe@redhat.com>
+  SUSE          Jiri Kosina <jkosina@suse.cz>
+
+  Google        Kees Cook <keescook@chromium.org>
+
+  LLVM          Nick Desaulniers <ndesaulniers@google.com>
+  ============= ========================================================
+
+Se você quiser que sua organização seja adicionada à lista de embaixadores,
+entre em contato com a equipe de segurança de hardware. O embaixador indicado
+deve compreender e apoiar totalmente o nosso processo e, idealmente, estar bem
+conectado na comunidade do kernel Linux.
+
+Listas de e-mail criptografadas
+-------------------------------
+
+Usamos listas de e-mail criptografadas para comunicação. O princípio de
+operação dessas listas é que o e-mail enviado para a lista é criptografado
+com a chave PGP da lista ou com o certificado S/MIME da lista. O software
+da lista de e-mail descriptografa o e-mail e o recriptografa individualmente
+para cada assinante com a chave PGP ou certificado S/MIME do assinante.
+Detalhes sobre o software da lista de e-mail e a configuração usada para
+garantir a segurança das listas e a proteção dos dados podem ser encontrados
+aqui: https://korg.wiki.kernel.org/userdoc/remail.
+
+Listas de chaves
+^^^^^^^^^^^^^^^^
+
+Para o contato inicial, consulte a seção :ref:`pt_BR_Contact` acima. Para listas de
+e-mail específicas de incidentes, a chave e o certificado S/MIME são transmitidos
+aos assinantes por e-mail enviado a partir da lista específica.
+
+Inscrição em listas específicas de incidentes
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+A inscrição em listas específicas de incidentes é gerenciada pelas equipes de
+resposta. As partes informadas que desejam participar da comunicação enviam
+uma lista de potenciais especialistas para a equipe de resposta, para que esta
+possa validar as solicitações de inscrição.
+
+Cada assinante precisa enviar uma solicitação de inscrição para a equipe de
+resposta por e-mail. O e-mail deve estar assinado com a chave PGP ou o certificado
+S/MIME do assinante. Se uma chave PGP for utilizada, ela deve estar disponível
+em um servidor de chaves público e, idealmente, conectada à teia de confiança
+(web of trust) PGP do kernel Linux. Veja também:
+https://www.kernel.org/signature.html.
+
+A equipe de resposta verifica se a solicitação do assinante é válida e o
+adiciona à lista. Após a inscrição, o assinante receberá e-mails da lista de
+e-mail que são assinados com a chave PGP da lista ou com o certificado S/MIME
+da lista. O cliente de e-mail do assinante pode extrair a chave PGP ou o
+certificado S/MIME da assinatura para que o assinante possa enviar e-mails
+criptografados para a lista.
\ No newline at end of file
diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index eda2a3fc5..969dd2407 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -72,6 +72,7 @@ gerenciamento de bugs e vulnerabilidades.
    :maxdepth: 1
 
    Falhas de segurança <security-bugs>
+   Problemas de hardware sob embargo <embargoed-hardware-issues>
    CVEs <cve>
 
 Informações para mantenedores
-- 
2.47.3

